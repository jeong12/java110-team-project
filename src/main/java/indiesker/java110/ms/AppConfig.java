package indiesker.java110.ms;

import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import indiesker.java110.ms.service.StatisticsService;

@Configuration
@PropertySource(
    {"classpath:/indiesker/java110/ms/conf/jdbc.properties",
    "classpath:/indiesker/java110/ms/conf/sec.properties" })
@MapperScan("indiesker.java110.ms.dao")
@EnableTransactionManagement
@EnableScheduling
public class AppConfig {

  @Autowired
  Environment env;
  @Autowired StatisticsService statisticsService;

  // 꽂혔는지 확인용 확인되면 지워연
  public AppConfig() {
    System.out.println("AppConfig() 호출됨!");
  }

  @Bean(destroyMethod="close")
  public DataSource dataSource() {
    System.out.println("Datasource 객체 생성!");
    BasicDataSource ds = new BasicDataSource();
    ds.setDriverClassName(env.getProperty("jdbc.driver"));
    ds.setUrl(env.getProperty("jdbc.url"));
    ds.setUsername(env.getProperty("jdbc.username"));
    ds.setPassword(env.getProperty("jdbc.password"));
    ds.setDefaultAutoCommit(false);
    return ds;
  }

  @Bean
  public SqlSessionFactory sqlSessionFactory(
      DataSource dataSource,
      ApplicationContext appCtx) {
    System.out.println("SqlSessionFactory 객체 생성!");
    System.out.println(dataSource);
    System.out.println(appCtx);
    try {
      SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
      factory.setDataSource(dataSource);

      factory.setTypeAliasesPackage("indiesker.java110.ms.domain");

      factory.setMapperLocations(appCtx.getResources(
          "classpath:/indiesker/java110/ms/mapper/**/*.xml"));

      return factory.getObject();
    } catch(Exception e) {
      throw new RuntimeException(e);
    }
  }

  @Bean
  public PlatformTransactionManager transactionManager(
      DataSource dataSource) {
    return new DataSourceTransactionManager(dataSource);

  }
  
  //통계
  @Scheduled(cron = "0 0 23 * * * ")
  public void scheduledByWeek() {
    statisticsService.scheduleService();
    System.out.println("실행됨 ㅎㅎㅎ");
  } 

  // 주로 테스트용!
  /*public static void main(String[] args) {

        ApplicationContext iocContainer = 
                new AnnotationConfigApplicationContext(AppConfig.class);

        System.out.println("------------------------------");

        int count = iocContainer.getBeanDefinitionCount();
        System.out.printf("bean 개수 = %d\n", count);

        String[] names = iocContainer.getBeanDefinitionNames();
        for (String name : names) {
            System.out.printf("=> %s : %s\n", 
                    name, 
                    iocContainer.getType(name).getName());
        }

        System.out.println("------------------------------");

        ManagerService s = (ManagerService) iocContainer.getBean(ManagerService.class);
        System.out.println(s.list(1, 5));

    }*/
}
