package org.apache.jsp.errorpage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class _404_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/WEB-INF/jsp/userfront/common/platSimpleLogoTop.jsp");
    _jspx_dependants.add("/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, false, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <title>前台404</title>\r\n");
      out.write("  <meta name=\"description\" content=\"前台404\">\r\n");
      out.write("  <!--[if IE]> <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <![endif]-->\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/css/bootstrap.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/css/global.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/css/login.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/css/style.css\">\r\n");
      out.write("  <!-- 字体图标ie7兼容性处理 -->\r\n");
      out.write("\t<!--[if lt IE 8]>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/css/font-awesome-ie7.min.css\">\r\n");
      out.write("\t<![endif]-->\r\n");
      out.write("\t\r\n");
      out.write("  <!--- jQuery -->\r\n");
      out.write("  <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/js/jquery-1.11.1.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!--[if lt IE 9]>\r\n");
      out.write("    <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/js/respond.min.js\"></script>\r\n");
      out.write("  <![endif]-->\r\n");
      out.write("  \r\n");
      out.write("   <!-- Favicon and Apple Icons -->\r\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" href=\"img/icon.png\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"bg_f5\"><!--body背景色与默认不一样，为f5f5f5-->\r\n");
      out.write("\t\r\n");
      out.write("<!--登录页简单的头部-->\r\n");
      out.write("\r\n");
      out.write("<div class=\"login_header clearfix\">\r\n");
      out.write("\t<div class=\"w_1280\">\r\n");
      out.write("\t\t<h1 class=\"y_logo\">\r\n");
      out.write("\t\t\t<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/\" \"></a>\r\n");
      out.write("\t\t</h1>\r\n");
      out.write(" \t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--404-->\r\n");
      out.write("<div id=\"content\" class=\"no-content\">\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"lg-margin\"></div><!-- Space -->\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"col-md-12\">\r\n");
      out.write("\t\t\t\t<div class=\"no-content-comment\">\r\n");
      out.write("\t      \t<h2>404</h2>\r\n");
      out.write("\t        <h3>不是我的错，伙计! <br>我想你可能迷路了</h3>\r\n");
      out.write("\t      </div><!-- End .no-content-comment -->\r\n");
      out.write("\t\t\t</div><!-- End .col-md-12 -->\r\n");
      out.write("\t\t</div><!-- End .row -->\r\n");
      out.write("\t</div><!-- End .container -->\r\n");
      out.write("</div><!-- End #content -->\r\n");
      out.write("\r\n");
      out.write("<!--简易底部-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<!--底部-->\r\n");
      out.write("\t<div class=\"footer simple_footer\">\r\n");
      out.write("\t\t<div class=\"footer-bottom\">\r\n");
      out.write("\t\t  <div class=\"container\">\r\n");
      out.write("\t\t  <aebiz:platConfig codeName='bottomInfo'/>\r\n");
      out.write("\t\t  </div><!-- End .container -->\r\n");
      out.write("\t\t</div><!-- End #footer-bottom -->\r\n");
      out.write("\t</div><!-- End #footer -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/frontpage/js/bootstrap.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\r\n");
      out.write("        // Simple Animation for 404 text\r\n");
      out.write("\r\n");
      out.write("            var container = $('.no-content-comment'),\r\n");
      out.write("                title = container.find('h2'),\r\n");
      out.write("                titleText = title.text(),\r\n");
      out.write("                message = container.find('h3'),\r\n");
      out.write("                messageText = message.text(),\r\n");
      out.write("                titleTextLen = titleText.length,\r\n");
      out.write("                messageTextLen = messageText.length,\r\n");
      out.write("                titleNew = '',\r\n");
      out.write("                messageNew = '',\r\n");
      out.write("                time = 50;\r\n");
      out.write("\r\n");
      out.write("           \r\n");
      out.write("           function iterate(len, text, newVar, target) {\r\n");
      out.write("                for (var i=0 ; i < len; i++) {\r\n");
      out.write("                    if (text[i] == '!') { // ! important for line breaks\r\n");
      out.write("                        newVar += '<span>'+text[i]+'<br></span>' \r\n");
      out.write("                    } else {\r\n");
      out.write("                        newVar += '<span>'+text[i]+'</span>';\r\n");
      out.write("                    }\r\n");
      out.write("               }\r\n");
      out.write("               target.html(newVar);\r\n");
      out.write("           }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("           iterate(titleTextLen, titleText, titleNew, title);\r\n");
      out.write("\r\n");
      out.write("           iterate(messageTextLen, messageText, messageNew, message);\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        $(window).on('load', function () {\r\n");
      out.write("            \r\n");
      out.write("            container.find('span').each(function () {\r\n");
      out.write("                time +=80;\r\n");
      out.write("                $(this).delay(200).animate({opacity: 1}, time);\r\n");
      out.write("            });\r\n");
      out.write("            \r\n");
      out.write("        });\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
