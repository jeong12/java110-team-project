package indiesker.java110.ms.web;

import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import indiesker.java110.ms.domain.BuskerSchedule;
import indiesker.java110.ms.domain.PerSchedule;
import indiesker.java110.ms.service.BuskerScheduleService;
import indiesker.java110.ms.service.PerScheduleService;

@Controller
@RequestMapping("/mybs")
public class BuskerPerScheduleController {

  BuskerScheduleService buskerscheduleService;
  PerScheduleService perscheduleService;
  ServletContext sc;


  public BuskerPerScheduleController(BuskerScheduleService buskerscheduleService,
      PerScheduleService perscheduleService,
      ServletContext sc) {
    this.buskerscheduleService = buskerscheduleService;
    this.perscheduleService = perscheduleService;
    this.sc = sc;
  }
  
  @PostMapping("add")
  public String add(PerSchedule perschedule) {
    
    perschedule.setNsdt(perschedule.getNsdt().toString());
    perschedule.setNedt(perschedule.getNsdt().substring(0, 10)+' '+perschedule.getNedt().toString());
    
    System.out.println(perschedule.getAddr());
    System.out.println(perschedule.getNsdt());
    System.out.println(perschedule.getNedt());
    System.out.println(perschedule.getShopname());
    System.out.println(perschedule.getX());
    System.out.println(perschedule.getY());
    
    perscheduleService.addSchedule(perschedule);
    
    return "redirect:main";
  }

  @GetMapping("main")
  public void main(
      @RequestParam(defaultValue="1")int pageNo, 
      @RequestParam(defaultValue="3")int pageSize, 
      Model model) {

    if (pageNo < 1)
      pageNo = 1;
    if (pageSize < 3 || pageSize > 10)
      pageSize = 3;

    pageSize=9;
    List<BuskerSchedule> list = buskerscheduleService.mybslist(pageNo, pageSize);
    List<PerSchedule> plist = perscheduleService.list(pageNo, pageSize);


    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    for (PerSchedule pl : plist) {
      pl.setNsdt(format.format(pl.getSdt()));
      pl.setNedt(format.format(pl.getEdt()));
    }

    for (BuskerSchedule ps : list) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
    }
    
    for (BuskerSchedule S : list) {
      System.out.println(S.getCdt());
    }
    
    
    model.addAttribute("list", list);
    model.addAttribute("plist", plist);
  }
  

  @ResponseBody
  @RequestMapping(value="clikeDate")
  public List<BuskerSchedule> getDateSchedule(
      @RequestParam(value="no") String no,@RequestParam(value="date")String date, Model model) {
    
    
    List<BuskerSchedule> clist = buskerscheduleService.findbydate(no, date);
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    for (BuskerSchedule ps : clist) {
      ps.setNsdt(format.format(ps.getSdt()));
      ps.setNedt(format.format(ps.getEdt()));
    }
    
    for (BuskerSchedule b : clist) {
      System.out.println("================");
      System.out.println(b.getName());
      System.out.println(b.getNsdt());
      System.out.println(b.getNedt());
    }
    
    //model.addAttribute("data",clist);
    return clist;
    
  }
  
  
  
  
}
