package indiesker.java110.ms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import indiesker.java110.ms.dao.MemberManagerDao;
import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.domain.GradleMember;
import indiesker.java110.ms.domain.Member;
import indiesker.java110.ms.domain.MemberManager;
import indiesker.java110.ms.domain.Paging;
import indiesker.java110.ms.domain.Supporter;
import indiesker.java110.ms.service.MemberManagerService;

@Service
public class MemberManagerServiceImpl implements MemberManagerService{

  @Autowired MemberManagerDao memberManagerDao;
  
  
  @Override
  public List<MemberManager> listAll(Paging paging) {
     Map<String,Object> params = new HashMap<>();
     params.put("paging", paging);        
      return memberManagerDao.findAll(params);
  }

  @Override
  public List<MemberManager> listSelect(char flag,int pageNo, int pageSize) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("flag", flag);
    params.put("rowNo", (pageNo - 1) * pageSize);
    params.put("size", pageSize);
    
    
    return memberManagerDao.findselect(params);
  }

@Override
public List<MemberManager> dateSelect(String flag, String text,String ncdt1,String ncdt2,int pageNo, int pageSize) {
  HashMap<String,Object> params = new HashMap<>();
  System.out.println("============================");
  params.put("flag", flag);
  System.out.println(flag);
  params.put("text", text);
  System.out.println(text);
  params.put("cdt1",ncdt1);
  System.out.println(ncdt1);
  params.put("cdt2",ncdt2);
  System.out.println(ncdt2);
  params.put("rowNo", (pageNo - 1) * pageSize);
  params.put("size", pageSize);
  
  List<MemberManager> list = memberManagerDao.searchSelect(params);
  
  for (MemberManager m : list) {
   System.out.println("서비스임");
   System.out.println("****************");
   System.out.println(m.getCdt());
   System.out.println("****************");
   System.out.println(m);
  }
  
  return list;
}

@Transactional
 @Override
  public int update(String memo, String nik) {
   
   HashMap<String,Object> params = new HashMap<>();
   params.put("memo", memo);
   params.put("nik",nik);
   
    return memberManagerDao.update(params);
  }
 
 
 @Override
 public Member memListDetail(String nik) {
   return memberManagerDao.memListDetail(nik);
 }



 @Override
 public Supporter supListDetail(String nik) {
   return memberManagerDao.supListDetail(nik);
 }

 @Override
 public Busker buskListDetail(String nik) {
   return memberManagerDao.buskListDetail(nik);
 }
 
 @Override
 public  List<MemberManager>  memberAjax(int flag, Paging paging) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("flag", flag);
   params.put("paging",paging);
   return memberManagerDao.memberAjax(params);
 }

 
 // 등급관리//////////////////////////////////////////////
 @Override
 public List<GradleMember> gradleBusker(int pageNo, int pageSize) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("rowNo", (pageNo - 1) * pageSize);
   params.put("size", pageSize);
   
   return memberManagerDao.gradleBusker(params);
 }

 @Override
 public List<GradleMember> gradleSupporter(int pageNo, int pageSize) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("rowNo", (pageNo - 1) * pageSize);
   params.put("size", pageSize);
   return memberManagerDao.gradleSupporter(params);
 }

 @Override
 public List<GradleMember> gradleAjaxBusker(int pageNo, int pageSize) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("rowNo", (pageNo - 1) * pageSize);
   params.put("size", pageSize);
   
   return memberManagerDao.gradleBusker(params);
 }

 @Override
 public List<GradleMember> gradleAjaxSupporter(int pageNo, int pageSize) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("rowNo", (pageNo - 1) * pageSize);
   params.put("size", pageSize);
   return memberManagerDao.gradleSupporter(params);
 }
 
 @Override
 public List<GradleMember> gradleAjaxBuskerSelect (String sflag, String text,int pageNo, int pageSize) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("text", text);
   params.put("sflag", sflag);
   params.put("rowNo", (pageNo - 1) * pageSize);
   params.put("size", pageSize);
   
   List<GradleMember> list = memberManagerDao.gradleAjaxBuskerSelect(params);
   
   
   return list;
 }

 @Override
 public List<GradleMember> gradleAjaxSupporterSelect (String sflag, String text,int pageNo, int pageSize) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("text", text);
   params.put("sflag", sflag);
   params.put("rowNo", (pageNo - 1) * pageSize);
   params.put("size", pageSize);
   
   List<GradleMember> list = memberManagerDao.gradleAjaxSupporterSelect(params);
   
   return list;
 }
 
 
 @Override//등급관리 서포터 상세보기
 public Supporter supGet(int no) {
   return memberManagerDao.findbyNo(no);
 }

 @Override// 등급관리 버스커 상세보기
 public Busker buskGet(int no) {
   return memberManagerDao.fidnBuskbyNo(no);
 }
 
 @Override// 등급관리 승인 버스커
 public int gradleBuskUpdate(int no) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("no",no);
   
    return memberManagerDao.gradleBuskUpdate(params);
 }

 @Override// 등급관리 승인 서포터
 public int gradleSupUpdate(int no) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("no",no);
   
    return memberManagerDao.gradleSupUpdate(params);
 }
 

@Override
public List<GradleMember> gradleSelect(char flag, String email, String nik, int pageNo,
    int pageSize) {
  // TODO Auto-generated method stub
  return null;
}

@Override
public List<String> memListDetailByGenre(String nik) {
  // TODO Auto-generated method stub
  return null;
}


@Override
public String getMemo(String nik) {
  return memberManagerDao.getMemo(nik);
}

@Override
public int totlist() {
  return memberManagerDao.totlist();
}

@Override
public int totlistFlag(int flag) {
  return memberManagerDao.totlistFlag(flag);
}

@Override
public void stopMem(String id, int flag) {
  if( flag < 10 ) {
    memberManagerDao.upStopMem(id);  
  }
  else {
    memberManagerDao.upUnStopMem(id);
  }
}










}
