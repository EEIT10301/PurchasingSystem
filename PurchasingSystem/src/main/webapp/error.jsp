<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
    <head>
<title>
Page Not Found
</title>
<script type="text/javascript" src="https://lc-www-live-s.legocdn.com/r/www/design/portal/errorpages/scripts/errorpages.js?l.r2=1.0.0.1587"></script><script src="https://lc-www-live-s.legocdn.com/r/www/design/global/js_9be41044a5320129c3569409189072abab01cfb2" type="text/javascript"></script>
<script src="https://lc-www-live-s.legocdn.com/r/www/design/www/js_cceba54125ae247b1f494adff7f984c8ce0764c5" type="text/javascript"></script><link href="https://lc-www-live-s.legocdn.com/r/www/design/global/css_8b3ca8593eba51da08eaf59c21af883f26e16c98" type="text/css" rel="stylesheet">
<link href="https://lc-www-live-s.legocdn.com/r/www/design/www/css_3096a292c25d9d486b215193ef77c12ddb5502e1" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://lc-www-live-s.legocdn.com/r/www/design/portal/errorpages/css/errorpages.css?l.r2=1.0.0.1587" /></head>
    <body  class="Genus ff ff630">      
      <div id="site" class="clearfix">
   <h2>Page Not Found</h2>
   <div class="userPrompt">
      <img src="https://lc-www-live-s.legocdn.com/r/www/-/media/portal%20v2010/errors/404%20mainstage%20image.jpg?l.r2=1953967734" alt="" />
      <div>
         <p>Sorry, we can't find that page! It might be an old link or maybe it moved.</p>
<!--          <a class="btn cancel large blue" href="errerPage"><span class="label">BACK TO LEGO.COM HOME </span><span class="decor"></span></a> -->
      </div>
   </div>
      </div>
        <script src="https://lc-www-live-s.legocdn.com/r/www/scripts/dist/release.js?l.r2=1.0.0.1587" type="text/javascript"></script>
    
    <%
     response.setHeader("Refresh","3; URL=errerPage");
    %>
    
    </body>
</html>