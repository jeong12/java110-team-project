package indiesker.java110.ms.web;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer{
  
//  @Override
//  public void addInterceptors(InterceptorRegistry registry) {
//    registry.addInterceptor(new AuthInterceptor())
//    .addPathPatterns("/**/list");
//  }
  // Java Config 인터셉터 안됨 => XML로 처리함

}
