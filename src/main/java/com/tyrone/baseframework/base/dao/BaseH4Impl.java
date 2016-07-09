package com.tyrone.baseframework.base.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tyrone.baseframework.base.vo.BaseModel;
import com.tyrone.baseframework.base.vo.ConditionOpTypeEnum;

@Repository
public class BaseH4Impl<M extends BaseModel, QM extends M> implements
        BaseDAO<M, QM> {
    private static Logger log = LoggerFactory.getLogger(BaseH4Impl.class);

    @Autowired
    private SessionFactory sessionFactory = null;

    public BaseH4Impl() {
    }

    protected Session getH4Session() {
        Session s = null;
        try {
            s = this.sessionFactory.getCurrentSession();
        } catch (Exception err) {
            s = this.sessionFactory.openSession();
        }
        return s;
    }

    protected void exeUpdate(String hql, Map<String, Object> mapParams) {
        Query q = getH4Session().createQuery(hql);

        for (String key : mapParams.keySet()) {
            Object obj = mapParams.get(key);
            if ((obj instanceof Object[])) {
                q.setParameterList(key, (Object[]) obj);
            } else {
                q.setParameter(key, obj);
            }
        }
        q.executeUpdate();
    }

    public String create(M m) {
        return (String) getH4Session().save(m);
    }

    public void update(M m) {
        getH4Session().update(m);
    }

    public void updateCell(M m, String opeCellName) {
        String hql = "update " + getModelClass().getName() + " o set o."
                + opeCellName + "=:" + opeCellName + " where o.uuid=:uuid";
        Map<String, Object> mapParams = new HashMap();
        mapParams.put(opeCellName, getOneFieldValue(m, opeCellName));
        mapParams.put("uuid", m.getUuid());

        exeUpdate(hql, mapParams);
    }

    public void delete(M m) {
        getH4Session().delete(m);
    }

    public void deletes(List<String> needDeleteUuids) {
        String hql = "delete from " + getModelClass().getName()
                + " o where o.uuid in (:uuids)";

        Map<String, Object> mapParams = new HashMap();
        mapParams.put("uuids", needDeleteUuids.toArray());

        exeUpdate(hql, mapParams);
    }

    public M getByUuid(String uuid) {
        return (M) getH4Session().get(getModelClass(), uuid);
    }

    public List<M> getAll() {
        return getAll(false, 0, 0);
    }

    public List<M> getAll(int start, int pageShow) {
        return getAll(true, start, pageShow);
    }

    private List<M> getAll(boolean needPage, int start, int pageShow) {
        String hql = "select o" + getMultiSelect() + " from "
                + getModelClass().getName() + " o " + getMultiModel()
                + " where 1=1 ";

        hql = hql + getAppendHql(null);

        Query q = getH4Session().createQuery(hql);
        if (needPage) {
            q.setFirstResult(start);
            q.setMaxResults(pageShow);
        }
        if ((getMultiSelect() != null)
                && (getMultiSelect().trim().length() > 0)) {
            List<Object[]> tempList = q.list();
            return exeResultList(tempList);
        }
        return q.list();
    }

    public List<String> getUuidsByCondition(QM qm, int start, int pageShow) {
        return getByCondition(true, true, qm, start, pageShow);
    }

    public List<M> getByCondition(QM qm) {
        return getByCondition(false, false, qm, 0, 0);
    }

    public List<M> getByCondition(QM qm, int start, int pageShow) {
        return getByCondition(false, true, qm, start, pageShow);
    }

    private List getByCondition(boolean onlyUuids, boolean needPage, QM qm,
            int start, int pageShow) {
        String hql = "select o" + getMultiSelect() + " from "
                + getModelClass().getName() + " o " + getMultiModel()
                + " where 1=1 ";

        if (onlyUuids) {
            hql = "select o.uuid from " + getModelClass().getName() + " o "
                    + getMultiModel() + " where 1=1 ";
        }

        hql = hql + prepareHql(qm);
        hql = hql + getAppendHql(qm);

        Query q = getH4Session().createQuery(hql);
        setValue(qm, q);
        setAppendHqlValue(qm, q);

        if (needPage) {
            q.setFirstResult(start);
            q.setMaxResults(pageShow);
        }

        if (onlyUuids) {
            return q.list();
        }

        if ((getMultiSelect() != null)
                && (getMultiSelect().trim().length() > 0)) {
            List<Object[]> tempList = q.list();
            return exeResultList(tempList);
        }
        List<M> retList = q.list();
        return retList;
    }

    protected String getMultiSelect() {
        return "";
    }

    protected String getMultiModel() {
        return "";
    }

    protected String getAppendHql(QM qm) {
        if (qm != null) {
            return "order by o." + qm.getSortName() + " " + qm.getSortType();
        }
        return "order by o.opeTime desc ";
    }

    protected void setAppendHqlValue(QM qm, Query q) {
    }

    protected List<M> exeResultList(List<Object[]> tempList) {
        return null;
    }

    protected void setValue(QM qm, Query q) {
        Map<String, Integer> map = qm.getMapCondition();

        for (String key : map.keySet()) {
            int opType = ((Integer) map.get(key)).intValue();
            if (key.endsWith("2")) {
                key = key.substring(0, key.length() - 1);
            }
            if (checkFieldValue(key, qm, opType)) {
                setOneConditionValue(q, key, qm, opType);
            }
        }
    }

    private Object[] getFieldAndMethod(String name, QM qm) {
        Field f = null;
        Method mth = null;
        try {
            f = qm.getClass().getDeclaredField(name);
            mth = qm.getClass().getDeclaredMethod(
                    "get" + name.substring(0, 1).toUpperCase()
                            + name.substring(1), new Class[0]);
        } catch (Exception e) {
        }

        if (f == null) {
            try {
                f = qm.getClass().getSuperclass().getDeclaredField(name);
                mth = qm.getClass()
                        .getSuperclass()
                        .getDeclaredMethod(
                                "get" + name.substring(0, 1).toUpperCase()
                                        + name.substring(1), new Class[0]);
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
                                "get" + name.substring(0, 1).toUpperCase()
                                        + name.substring(1), new Class[0]);
            } catch (Exception e) {
            }
        }

        return new Object[] { f, mth };
    }

    private Object getOneFiledValue(String name, QM qm) {
        Object[] objs = getFieldAndMethod(name, qm);
        Field f = (Field) objs[0];
        Method mth = (Method) objs[1];

        Object value = null;
        try {
            value = mth.invoke(qm, new Object[0]);
        } catch (Exception e) {
        }

        return value;
    }

    private boolean checkFieldValue(String name, QM qm, int opType) {
        Object[] objs = getFieldAndMethod(name, qm);
        Field f = (Field) objs[0];

        Object value = null;
        if (opType == ConditionOpTypeEnum.LT.getCode()) {
            value = getOneFiledValue(name + "2", qm);
        } else {
            value = getOneFiledValue(name, qm);
        }

        if (f.getType().getName().contains("String"))
            return (value != null) && (((String) value).trim().length() > 0);
        if ((f.getType().getName().contains("int"))
                || (f.getType().getName().contains("Integer"))
                || (f.getType().getName().contains("long"))
                || (f.getType().getName().contains("Long"))
                || (f.getType().getName().contains("float"))
                || (f.getType().getName().contains("Float"))
                || (f.getType().getName().contains("double"))
                || (f.getType().getName().contains("Double"))) {

            if (value != null) {
                return ((Number) value).doubleValue() > 0.0D;
            }
            return false;
        }
        return false;
    }

    private void setOneConditionValue(Query q, String name, QM qm, int opType) {
        Object value = getOneFiledValue(name, qm);
        Field f = (Field) getFieldAndMethod(name, qm)[0];

        if (f.getType().getName().contains("String")) {
            if (opType == ConditionOpTypeEnum.Like.getCode()) {
                q.setString(name, "%" + value + "%");
            } else if (opType == ConditionOpTypeEnum.LeftLike.getCode()) {
                q.setString(name, "%" + value);
            } else if (opType == ConditionOpTypeEnum.RightLike.getCode()) {
                q.setString(name, value + "%");
            } else if (opType == ConditionOpTypeEnum.LT.getCode()) {
                q.setString(
                        name + "2",
                        ""
                                + getOneFiledValue(
                                        new StringBuilder().append(name)
                                                .append("2").toString(), qm));
            } else if (opType == ConditionOpTypeEnum.IN.getCode()) {
                q.setParameterList(name, ((String) value).split(","));
            } else {
                q.setString(name, "" + value);
            }
        } else if ((f.getType().getName().contains("int"))
                || (f.getType().getName().contains("Integer"))
                || (f.getType().getName().contains("long"))
                || (f.getType().getName().contains("Long"))
                || (f.getType().getName().contains("float"))
                || (f.getType().getName().contains("Float"))
                || (f.getType().getName().contains("double"))
                || (f.getType().getName().contains("Double"))) {

            if (opType == ConditionOpTypeEnum.LT.getCode()) {
                q.setParameter(name + "2", getOneFiledValue(name + "2", qm));
            } else if (opType == ConditionOpTypeEnum.IN.getCode()) {
                q.setParameterList(name, ((String) value).split(","));
            } else {
                q.setParameter(name, value);
            }
        }
    }

    private String addOneCondition(String name, int opType) {
        if (opType == ConditionOpTypeEnum.EQ.getCode())
            return " and o." + name + " = :" + name + " ";
        if ((opType == ConditionOpTypeEnum.Like.getCode())
                || (opType == ConditionOpTypeEnum.LeftLike.getCode())
                || (opType == ConditionOpTypeEnum.RightLike.getCode())) {

            return " and o." + name + " like :" + name + " ";
        }
        if (opType == ConditionOpTypeEnum.GE.getCode())
            return " and o." + name + " >= :" + name + " ";
        if (opType == ConditionOpTypeEnum.GT.getCode())
            return " and o." + name + " > :" + name + " ";
        if (opType == ConditionOpTypeEnum.LT.getCode())
            return " and o." + name + " < :" + name + "2 ";
        if (opType == ConditionOpTypeEnum.IN.getCode()) {
            return " and o." + name + " in (:" + name + ") ";
        }
        return "";
    }

    protected String prepareHql(QM qm) {
        StringBuffer buffer = new StringBuffer();
        Map<String, Integer> map = qm.getMapCondition();

        for (String key : map.keySet()) {
            int opType = ((Integer) map.get(key)).intValue();
            if (key.endsWith("2")) {
                key = key.substring(0, key.length() - 1);
            }
            if (checkFieldValue(key, qm, opType)) {
                buffer.append(" " + addOneCondition(key, opType) + " ");
            }
        }
        return buffer.toString();
    }

    public int getCount(QM qm) {
        String hql = "select count(o) from " + getModelClass().getName()
                + " o " + getMultiModel() + " where 1=1 ";

        hql = hql + prepareHql(qm);
        hql = hql + getAppendHql(qm);

        Query q = getH4Session().createQuery(hql);
        setValue(qm, q);
        setAppendHqlValue(qm, q);

        return ((Number) q.uniqueResult()).intValue();
    }

    public void setDataDeleteFlag(String uuid, int delFlag) {
        String hql = "update " + getModelClass().getName()
                + " o set o.delFlag=:delFlag where o.uuid=:uuid";
        Map<String, Object> map = new HashMap();
        map.put("uuid", uuid);
        map.put("delFlag", Integer.valueOf(delFlag));

        exeUpdate(hql, map);
    }

    private Class getModelClass() {
        try {
            ParameterizedType pt = (ParameterizedType) getClass()
                    .getGenericSuperclass();
            Type t = pt.getActualTypeArguments()[0];
            String name = t.toString().substring("class ".length()).trim();
            return Class.forName(name);
        } catch (Exception e) {
        }

        return null;
    }

    private Object getOneFieldValue(Object obj, String fieldName) {
        try {
            Method mth = obj.getClass().getDeclaredMethod(
                    "get" + fieldName.substring(0, 1).toUpperCase()
                            + fieldName.substring(1), new Class[0]);
            return mth.invoke(obj, new Object[0]);
        } catch (Exception err) {
        }
        return null;
    }
}
