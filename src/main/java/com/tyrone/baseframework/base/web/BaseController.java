package com.tyrone.baseframework.base.web;

import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tyrone.baseframework.base.service.BaseService;
import com.tyrone.baseframework.base.vo.BaseModel;
import com.tyrone.baseframework.base.vo.ConditionOpTypeEnum;
import com.tyrone.baseframework.base.vo.DataTablesPageParam;
import com.tyrone.baseframework.base.web.vo.BaseWebModel;
import com.tyrone.baseframework.exception.AppException;
import com.tyrone.baseframework.exception.LogException;
import com.tyrone.baseframework.utils.StringUtil;

public class BaseController<M extends BaseModel, QM extends M> {

    public static final String ERROR_BACK_URL = "ERROR_BACK_URL";
    public static final String ERROR_MSG_PRE = "ShowMsgs";
    protected BaseService<BaseModel, M> bs = null;
    private Map<String, List<String>> mapErrorMsg = new HashMap<String, List<String>>();

    private Logger log = null;

    private String moduleName = "";

    private String moduleJspPath = "";

    public BaseController(String moduleJspPath, String moduleName,
            Class controllerClass) {
        this.moduleJspPath = moduleJspPath;
        this.moduleName = moduleName;
        this.log = LoggerFactory.getLogger(controllerClass);
    }

    public void setBs(BaseService bs) {
        this.bs = bs;
    }

    public Map<String, List<String>> getMapErrorMsg() {
        return this.mapErrorMsg;
    }

    public void putErrorMsg(String key, String msg) {
        List<String> list = new ArrayList();
        Object obj = this.mapErrorMsg.get(key);
        if (obj != null) {
            list = (List) obj;
        }
        list.add(msg);
        this.mapErrorMsg.put(key, list);
    }

    @ExceptionHandler({ Exception.class })
    public String exceptionExecute(Exception ex, HttpServletRequest request) {
        ex.printStackTrace();

        if ((ex instanceof AppException)) {
            AppException ae = (AppException) ex;
            putErrorMsg(ae.getCompId(), ae.getMessage());
            request.setAttribute("ShowMsgs", getMapErrorMsg());
            return ae.getShowMsgPage();
        }
        if ((ex instanceof LogException)) {
            LogException lex = (LogException) ex;
            this.log.error(lex.getLogInfo(), lex.getOriginException());
        } else {
            this.log.error("", ex);
        }
        return "error/ErrorPage";
    }

    @RequestMapping(value = { "/toAdd" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
    public String toAdd(Model model, HttpServletRequest request) {
        preparedAddData(model, request);
        return this.moduleJspPath + "/" + this.moduleName + "Add";
    }

    protected void preparedAddData(Model model, HttpServletRequest request) {
    }

    protected boolean checkAdd(Model model, M m, HttpServletRequest request) {
        return true;
    }

    @RequestMapping(value = { "/add" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
    public String add(Model model, @ModelAttribute("m") M m,
            HttpServletRequest request) {
        this.mapErrorMsg = new HashMap<String, List<String>>();
        if (!checkAdd(model, m, request)) {
            request.setAttribute("ShowMsgs", this.mapErrorMsg);
            return (String) request.getAttribute("ERROR_BACK_URL");
        }
        cleanQuerySession(request);
        this.bs.create(m);
        return this.moduleJspPath + "/" + this.moduleName + "Success";
    }

    @RequestMapping(value = { "/toUpdate/{uuid}" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
    public String toUpdate(@PathVariable("uuid") String uuid, Model model,
            HttpServletRequest request) {
        M m = (M)this.bs.getByUuid(uuid);

        model.addAttribute("m", m);

        preparedUpdateData(model, request);

        return this.moduleJspPath + "/" + this.moduleName + "Update";
    }

    protected void preparedUpdateData(Model model, HttpServletRequest request) {
    }

    protected boolean checkUpdate(Model model, M m, HttpServletRequest request) {
        return true;
    }

    @RequestMapping(value = { "/update" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
    public String update(Model model, @ModelAttribute("m") M m,
            HttpServletRequest request) {
        this.mapErrorMsg = new HashMap<String, List<String>>();
        if (!checkUpdate(model, m, request)) {
            request.setAttribute("ShowMsgs", this.mapErrorMsg);
            return (String) request.getAttribute("ERROR_BACK_URL");
        }

        this.bs.update(m);
        return this.moduleJspPath + "/" + this.moduleName + "Success";
    }

    @ResponseBody
    @RequestMapping({ "/updateCell" })
    public String updateCell(M m, HttpServletRequest request) {
        String opeCellName = request.getParameter("opeCellName");

        this.bs.updateCell(m, opeCellName);

        return "true";
    }

    @RequestMapping(value = { "/toDelete/{uuid}" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
    public String toDelete(@PathVariable("uuid") String uuid, Model model,
            HttpServletRequest request) {
        M m = (M)this.bs.getByUuid(uuid);

        model.addAttribute("m", m);
        preparedDeleteData(model, request);
        return this.moduleJspPath + "/" + this.moduleName + "Delete";
    }

    protected void preparedDeleteData(Model model, HttpServletRequest request) {
    }

    @RequestMapping(value = { "/delete" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
    public String delete(M m, HttpServletRequest request) {
        cleanQuerySession(request);
        this.bs.delete(m);
        return this.moduleJspPath + "/" + this.moduleName + "Success";
    }

    @RequestMapping(value = { "/deletes" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
    public String deletes(
            @RequestParam("selectOne") List<String> needDeleteUuids,
            BaseWebModel wm, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        this.bs.deletes(needDeleteUuids);

        Map<String, Object> jsonMap = new HashMap<String, Object>();

        jsonMap.put("rsp", Boolean.valueOf(true));
        PrintWriter out = response.getWriter();
        out.print(JSON.toJSONString(jsonMap));

        return null;
    }

    @RequestMapping(value = { "/toInfo/{uuid}" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
    public String toInfo(@PathVariable("uuid") String uuid, Model model,
            HttpServletRequest request) {
        M m = (M)this.bs.getByUuid(uuid);

        model.addAttribute("m", m);

        preparedInfoData(model, request);

        return this.moduleJspPath + "/" + this.moduleName + "Info";
    }

    protected void preparedInfoData(Model model, HttpServletRequest request) {
    }

    @RequestMapping(value = { "/toList" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
    public String toList(Model model, HttpServletRequest request) {
        preparedListData(model, request);
        return this.moduleJspPath + "/" + this.moduleName + "List";
    }

    protected void preparedListData(Model model, HttpServletRequest request) {
    }

    @RequestMapping({ "/queryList" })
    public String queryList(HttpServletResponse response,
            HttpServletRequest request) throws Exception {
        List<BaseModel> showList = new ArrayList<BaseModel> ();

        Map<String, Object> pageParamMap = parsePageParam(request);

        QM qm = parseQueryModel(request);

        qm = preparedQMFixValue(qm);

        int iDisplayStart = ((Integer) pageParamMap.get("iDisplayStart"))
                .intValue();

        int iDisplayLength = ((Integer) pageParamMap.get("iDisplayLength"))
                .intValue();

        int iSortCol_0 = ((Integer) pageParamMap.get("iSortCol_0")).intValue();

        String sortFieldName = (String) pageParamMap.get("mDataProp_"
                + iSortCol_0);

        String sortTypeString = (String) pageParamMap.get("sSortDir_0");

        Boolean needSort = (Boolean) pageParamMap
                .get("bSortable_" + iSortCol_0);

        if (needSort.booleanValue()) {
            qm.setSortName(sortFieldName);
            qm.setSortType(sortTypeString);
        }

        List<M> listData = (List<M>) this.bs.getByCondition(qm, iDisplayStart,
                iDisplayLength);

        int totalCount = this.bs.getCount(qm);

        for (int i = 0; i < listData.size(); i++) {
            M m = (M) listData.get(i);
            showList.add(m);
        }

        Map<String, Object> jsonMap = new HashMap<String, Object>();

        jsonMap.put("sEcho", pageParamMap.get("sEcho"));
        jsonMap.put("iTotalRecords", Integer.valueOf(totalCount));
        jsonMap.put("iTotalDisplayRecords", Integer.valueOf(totalCount));
        jsonMap.put("aaData", showList);

        response.setContentType("charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        out.print(JSON.toJSONString(jsonMap));

        return null;
    }

    protected QM parseQueryModel(HttpServletRequest request) {
        String searchParam = request.getParameter("searchParam");
        QM qm = getQueryModel();
        Map<String, Object> searchParamMap = new HashMap<String, Object>();
        JSONArray searParamArr = JSONArray.parseArray(searchParam);

        for (Object o : searParamArr) {
            JSONObject jo = (JSONObject) o;
            DataTablesPageParam dtpp = (DataTablesPageParam) JSON.parseObject(
                    jo.toJSONString(), DataTablesPageParam.class);

            searchParamMap.put(dtpp.getName(), dtpp.getValue());
        }

        for (String key : searchParamMap.keySet()) {
            String v = (String) searchParamMap.get(key);
            if (key.endsWith("_q")) {
                qm.getMapCondition().put(
                        key.substring(0, key.length() - 2),
                        Integer.valueOf(ConditionOpTypeEnum.valueOf(v)
                                .getCode()));
            } else {
                String fieldname = key;

                if (key.endsWith("_s")) {
                    fieldname = key.substring(0, key.length() - 2);
                }

                if (!StringUtil.isEmpty(v)) {
                    getOneFiledValue(fieldname, searchParamMap.get(key), qm);
                }
            }
        }

        return qm;
    }

    protected Map<String, Object> parsePageParam(HttpServletRequest request) {
        String data = request.getParameter("aoData");

        Map<String, Object> pageParamMap = new HashMap<String, Object>();
        JSONArray jsonArr = JSONArray.parseArray(data);
        for (Object o : jsonArr) {
            JSONObject jo = (JSONObject) o;
            DataTablesPageParam dtpp = (DataTablesPageParam) JSON.parseObject(
                    jo.toJSONString(), DataTablesPageParam.class);

            pageParamMap.put(dtpp.getName(), dtpp.getValue());
        }
        return pageParamMap;
    }

    protected void cleanQuerySession(HttpServletRequest request) {
        SecurityUtils.getSubject().getSession()
                .removeAttribute(this.moduleName + "IsQuery");
        SecurityUtils.getSubject().getSession()
                .removeAttribute(this.moduleName + "QueryModel");
    }

    protected QM getQueryModel() {
        try {
            ParameterizedType pt = (ParameterizedType) getClass()
                    .getGenericSuperclass();
            Type t = pt.getActualTypeArguments()[1];
            String name = t.toString().substring("class ".length()).trim();
            return (QM) Class.forName(name).newInstance();
        } catch (Exception e) {
            throw new LogException("PageErrorMsg", "getQueryModel", e);
        }
    }

    protected void getOneFiledValue(String name, Object queryValue, QM qm) {
        Object[] objs = getFieldAndMethod(name, qm);
        Method mth = (Method) objs[1];

        try {
            if ((queryValue != null)
                    && (queryValue.toString().trim().length() > 0)) {
                Class type = mth.getParameterTypes()[0];
                if ((type == Integer.TYPE) || (type == Integer.class)) {
                    queryValue = Integer.valueOf(Integer.parseInt(""
                            + queryValue));
                } else if ((type == Float.TYPE) || (type == Float.class)) {
                    queryValue = Float.valueOf(Float
                            .parseFloat("" + queryValue));
                } else if ((type == Double.TYPE) || (type == Double.class)) {
                    queryValue = Double.valueOf(Double.parseDouble(""
                            + queryValue));
                } else if ((type == Boolean.TYPE) || (type == Boolean.class)) {
                    queryValue = Boolean.valueOf("" + queryValue);
                }
            }
            mth.invoke(qm, new Object[] { queryValue });
        } catch (Exception e) {
        }
    }

    protected Object[] getFieldAndMethod(String name, QM qm) {
        Field f = null;

        Method mth = null;
        try {
            f = qm.getClass().getDeclaredField(name);
            mth = qm.getClass().getDeclaredMethod(
                    "set" + name.substring(0, 1).toUpperCase()
                            + name.substring(1), new Class[] { f.getType() });
        } catch (Exception e) {
        }

        if (f == null) {
            try {
                f = qm.getClass().getSuperclass().getDeclaredField(name);
                mth = qm.getClass()
                        .getSuperclass()
                        .getDeclaredMethod(
                                "set" + name.substring(0, 1).toUpperCase()
                                        + name.substring(1),
                                new Class[] { f.getType() });
            } catch (Exception e) {
            }
        }
        if (f == null) {
            try {
                f = qm.getClass().getSuperclass().getSuperclass()
                        .getDeclaredField(name);

                mth = qm.getClass()
                        .getSuperclass()
                        .getSuperclass()
                        .getDeclaredMethod(
                                "set" + name.substring(0, 1).toUpperCase()
                                        + name.substring(1),
                                new Class[] { f.getType() });
            } catch (Exception e) {
            }
        }
        return new Object[] { f, mth };
    }

    @RequestMapping(value = { "/toList/{nowPage}/{pageShow}" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
    public String toList(@ModelAttribute("wm") BaseWebModel wm, Model model,
            HttpServletRequest request) {
        QM qm = getQueryModel();

        String init = request.getParameter("init");
        if (!"true".equalsIgnoreCase(init)) {
            Object obj = SecurityUtils.getSubject().getSession()
                    .getAttribute(this.moduleName + "IsQuery");
            if ((obj != null) && (obj.toString().equals("true"))) {
                qm = (QM) SecurityUtils.getSubject().getSession()
                        .getAttribute(this.moduleName + "QueryModel");
            }
        }

        qm.setStatus(1);
        qm.getMapCondition().put("status",
                Integer.valueOf(ConditionOpTypeEnum.EQ.getCode()));

        qm = preparedQMFixValue(qm);

        wm.setTotalNum(this.bs.getCount(qm));
        List<M> list = (List<M>) this.bs.getByCondition(qm, wm.getFromNum(),
                wm.getPageShow());

        wm.setRows(list);

        request.setAttribute("qm", qm);

        preparedListData(model, request);
        return this.moduleJspPath + "/" + this.moduleName + "List";
    }

    protected QM preparedQMFixValue(QM qm) {
        return qm;
    }

    protected boolean checkQuery(QM qm, HttpServletRequest request) {
        return true;
    }

    @RequestMapping(value = { "/query" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
    public String query(@ModelAttribute("qm") QM qm,
            @RequestParam("pageShow") String pageShow,
            HttpServletRequest request) {
        this.mapErrorMsg = new HashMap<String, List<String>>();
        if (!checkQuery(qm, request)) {
            request.setAttribute("ShowMsgs", this.mapErrorMsg);
            return (String) request.getAttribute("ERROR_BACK_URL");
        }

        Map<String, String[]> map = request.getParameterMap();
        for (String key : map.keySet()) {
            if (key.endsWith("_q")) {
                String v = ((String[]) map.get(key))[0];
                qm.getMapCondition().put(
                        key.substring(0, key.length() - 2),
                        Integer.valueOf(ConditionOpTypeEnum.valueOf(v)
                                .getCode()));
            }
        }

        SecurityUtils.getSubject().getSession()
                .setAttribute(this.moduleName + "IsQuery", "true");
        SecurityUtils.getSubject().getSession()
                .setAttribute(this.moduleName + "QueryModel", qm);

        return "redirect:toList/1/" + pageShow;
    }
}
