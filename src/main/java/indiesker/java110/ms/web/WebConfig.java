package indiesker.java110.ms.web;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import indiesker.java110.ms.web.interceptor.ExInterceptor;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer{

  public WebConfig() {
    System.out.println("WebConfig() 호출됨! test...");
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new ExInterceptor())
    .addPathPatterns("/**/add", "/**/delete");
  }

}
