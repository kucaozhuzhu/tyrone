package com.tyrone.baseframework.filter;  
/** 
 * ClassName:q <br/> 
 * Function: TODO ADD FUNCTION. <br/> 
 * Reason:   TODO ADD REASON. <br/> 
 * Date:     2016-7-6 下午7:29:28 <br/> 
 * @author   tanyan 
 * @version   
 * @see       
 */

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.tyrone.baseframework.utils.StringUtil;



public class SQLFilter implements Filter {
    private static Logger log = Logger.getLogger("sql_filter_logger");
    protected FilterConfig filterConfig = null;

    //private String sqlURL = "";

    public SQLFilter() {
    }

    /**
     * 初始化方法
     */
    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;
        String value = filterConfig.getInitParameter("sqlURL");
        if (!StringUtil.isEmpty(value)) {
            //this.sqlURL = value;
        }
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        if (isError(request)) {
            httpResponse.setContentType("text/html; charset=UTF-8");
            //httpResponse.setHeader("Set-Cookie", "HttpOnly; ");
            // RequestDispatcher rd = request.getRequestDispatcher(sqlURL);
            // rd.forward(request, response);
            httpResponse.sendRedirect(httpRequest.getContextPath()
                    + "/errorpage/sqlerror.jsp");
        } else {
            String serletPath = httpRequest.getServletPath();
            if (!serletPath.startsWith("/sysback/") && !serletPath.startsWith("/admin/") && !serletPath.startsWith("/storeback/") && !serletPath.startsWith("/tclcustomer/") && !serletPath.startsWith("/store/") && !serletPath.startsWith("/static/")) {
                Cookie[] cookies = httpRequest.getCookies();

                if (cookies != null && cookies.length > 0) {
                    Cookie cookie = cookies[0];
                    if (cookie != null) {
                    }
                }
            }
            

            chain.doFilter(httpRequest, httpResponse);
        }
    }

    public void destroy() {
        /*
         * called before the Filter instance is removed from service by the web
         * container
         */
        this.filterConfig = null;
    }

    private boolean isError(ServletRequest request) {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        Iterator<String[]> values = httpRequest.getParameterMap().values().iterator();// 获取所有的表单参数
        Iterator<String[]> values2 = httpRequest.getParameterMap().values().iterator();// 获取所有的表单参数
        boolean isError = false;
        try {
            // 字符窜标签的正则表达式 可能注入的关键字和被钓鱼利用的参数
            // SCRIPT|STYLE|IFRAME|IMG|SELECT|UPDATE|AND|OR|DELETE|INSERT|TRANCATE|CHAR|CHR|INTO|SUBSTR|ASCII|DECLARE|EXEC|COUNT|MASTER|INTO|DROP|EXECUTE|

            String regEx_sql = "select|update|and|or|delete|insert|trancate|char|chr|into|substr|ascii|declare|exec|count|master|drop|execute"; 
            // sql注入过滤
            while (values.hasNext()) {

                String[] valueArray = (String[]) values.next();

                for (int i = 0; i < valueArray.length; i++) {
                    String value = valueArray[i];
                    // 分拆关键字

                    String[] inj_stra = regEx_sql.split("\\|");

                    for (int j = 0; j < inj_stra.length; j++) {
                        // 判断如果路径参数值中含有关键字则返回true,并且结束循环
                        if("and".equals(inj_stra[j]) || "or".equals(inj_stra[j]) || "into".equals(inj_stra[j])){
                            if (value.toLowerCase()
                                    .indexOf(" " + inj_stra[j] + " ") != -1) {
                                isError = true;
                                log.info(" SQL 关键字过滤异常1，参数值："+value+";链接："+httpRequest.getServletPath());
                                break;
                            }
                        }else {
                            if (value.toLowerCase()
                                    .indexOf(" " + inj_stra[j] + " ") != -1
                                    || value.toLowerCase().indexOf(
                                            inj_stra[j] + " ") != -1) {
                                isError = true;
                                log.info(" SQL 关键字过滤异常2，参数值："+value+";链接："+httpRequest.getServletPath());
                                break;
                            }
                        }
                    }

                    if (isError) {
                        break;
                    }

                }

                if (isError) {
                    break;
                }

            }

            String serletPath = httpRequest.getServletPath();
            if (serletPath.startsWith("/sysback/platDfFront/save") || serletPath.startsWith("/dfFront") || serletPath.startsWith("/storeback/storedecorator/updateStyle")) { //serletPath.startsWith("/sysback/") || serletPath.startsWith("/admin/")
                return isError;
            } else if (!isError) {
                //以前的验证，不知道为啥前后加空格
                String regEx_xss = "script|iframe";
                
                //新加验证，验证不加空格的
                String regEx_xss_noBlank="expression(";
                // XSS漏洞过滤
                while (values2.hasNext()) {

                    String[] valueArray = (String[]) values2.next();

                    for (int i = 0; i < valueArray.length; i++) {
                        String value = valueArray[i];

                        // 分拆关键字
                        String[] inj_stra = regEx_xss.split("\\|");
                        for (int j = 0; j < inj_stra.length; j++) {
                            // 判断如果路径参数值中含有关键字则返回true,并且结束循环
                            if (value.toLowerCase().indexOf("<" + inj_stra[j]) != -1
                                    ||value.toLowerCase().indexOf(inj_stra[j]+">") != -1
                                    ||value.toLowerCase().indexOf(" " + inj_stra[j] + " ") != -1
                                    || value.toLowerCase().indexOf(" "+inj_stra[j]) != -1
                                    || value.toLowerCase().indexOf(inj_stra[j] + " ") != -1
                                    || value.toLowerCase().indexOf("<"+inj_stra[j]+">") != -1) {
                                log.info(" SQL 关键字过滤异常3，参数值："+value+";链接："+serletPath);
                                isError = true;
                                break;
                            }
                        }
                        
                        /*新加验证，有验证不加空格的start*/
                        // 分拆关键字
                        String[] inj_stra_noBlank = regEx_xss_noBlank.split("\\|");
                        for (int j = 0; j < inj_stra_noBlank.length; j++) {
                            if (value.toLowerCase().indexOf(inj_stra_noBlank[j]) != -1
                                    ||value.toLowerCase().indexOf("<" + inj_stra_noBlank[j]) != -1
                                    ||value.toLowerCase().indexOf(inj_stra_noBlank[j]+">") != -1
                                    ||value.toLowerCase().indexOf(" " + inj_stra_noBlank[j] + " ") != -1
                                    || value.toLowerCase().indexOf(" "+inj_stra_noBlank[j]) != -1
                                    || value.toLowerCase().indexOf(inj_stra_noBlank[j] + " ") != -1) {
                                log.info(" SQL 关键字过滤异常3，参数值："+value+";链接："+serletPath);
                                isError = true;
                                break;
                            }
                        }
                        /*新加验证，有验证不加空格的end*/

                        if (isError) {
                            break;
                        }

                    }

                    if (isError) {
                        break;
                    }

                }
                
                // 如果是admin后台，则根据请求参数进行过滤
                if(serletPath.startsWith("/admin/toIndex")){
                    String uri = httpRequest.getRequestURI();
                    String selMenu = httpRequest.getParameter("selMenu");
                    String admin_regEx = "script|iframe";
                    String[] inj_stra = admin_regEx.split("\\|");
                    for (int j = 0; j < inj_stra.length; j++) {
                        if (!StringUtil.isEmpty(uri) && (uri.toLowerCase().indexOf(inj_stra[j] + ">") != -1
                                || uri.toLowerCase().indexOf("<" + inj_stra[j]) != -1
                                || uri.toLowerCase().indexOf("<" + inj_stra[j] + ">") != -1)) {
                            isError = true;
                            break;
                        }
                        if (!StringUtil.isEmpty(selMenu) && selMenu.toLowerCase()
                                .indexOf(inj_stra[j] + ">") != -1) {
                            isError = true;
                            break;
                        }
                    }
                }
            }

        } catch (Exception e) {
            log.error("error", e);
        }
        return isError;
    }

}

  