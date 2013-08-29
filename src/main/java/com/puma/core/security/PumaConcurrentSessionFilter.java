package com.puma.core.security;


import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.util.UrlUtils;
import org.springframework.util.Assert;
import org.springframework.web.filter.GenericFilterBean;

import com.puma.util.WebUtils;


public class PumaConcurrentSessionFilter extends GenericFilterBean {
   //~ Instance fields ================================================================================================

   private SessionRegistry sessionRegistry;
   private String expiredUrl;
   private LogoutHandler[] handlers = new LogoutHandler[] {new SecurityContextLogoutHandler()};
   private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

   //~ Methods ========================================================================================================

   @Override
   public void afterPropertiesSet() {
       Assert.notNull(sessionRegistry, "SessionRegistry required");
       Assert.isTrue(expiredUrl == null || UrlUtils.isValidRedirectUrl(expiredUrl),
               expiredUrl + " isn't a valid redirect URL");
   }

   public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
           throws IOException, ServletException {
       HttpServletRequest request = (HttpServletRequest) req;
       HttpServletResponse response = (HttpServletResponse) res;

       HttpSession session = request.getSession(false);

       if (session != null) {
           SessionInformation info = sessionRegistry.getSessionInformation(session.getId());

           if (info != null) {
               if (info.isExpired()) {
                   // Expired - abort processing
                   doLogout(request, response);

                   String targetUrl = determineExpiredUrl(request, info);
                   
            	   if(WebUtils.isAjaxRequest(request)){
             		   response.setContentType("text/html;charset=UTF-8");
                 	   response.setStatus(PumaResponseStatus.PUMA_SC_SESSION_KICKOUT);
                 	  return;
             	   }else{
             		   if (targetUrl != null) {
             			    request.getSession();
                            redirectStrategy.sendRedirect(request, response, targetUrl);
                            return;
                        }
             	   }
               } else {
                   // Non-expired - update last request date/time
                   info.refreshLastRequest();
               }
           }
       }

       chain.doFilter(request, response);
   }

   protected String determineExpiredUrl(HttpServletRequest request, SessionInformation info) {
       return expiredUrl;
   }

   private void doLogout(HttpServletRequest request, HttpServletResponse response) {
       Authentication auth = SecurityContextHolder.getContext().getAuthentication();

       for (int i = 0; i < handlers.length; i++) {
           handlers[i].logout(request, response, auth);
       }
   }

   public void setExpiredUrl(String expiredUrl) {
       this.expiredUrl = expiredUrl;
   }

   public void setSessionRegistry(SessionRegistry sessionRegistry) {
       this.sessionRegistry = sessionRegistry;
   }

   public void setLogoutHandlers(LogoutHandler[] handlers) {
       Assert.notNull(handlers);
       this.handlers = handlers;
   }

   public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
       this.redirectStrategy = redirectStrategy;
   }
}
