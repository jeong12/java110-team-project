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
public List<MemberManager> dateSelect(String flag, String text,String ncdt1,String ncdt2,Paging paging) {
  HashMap<String,Object> params = new HashMap<>();
  params.put("flag", flag);
  System.out.println(flag);
  params.put("text", text);
  System.out.println(text);
  params.put("cdt1",ncdt1);
  System.out.println(ncdt1);
  params.put("cdt2",ncdt2);
  System.out.println(ncdt2);
  params.put("paging",paging);
  return memberManagerDao.searchSelect(params);
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
 public List<GradleMember> gradleList(Paging paging) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("paging", paging);
   return memberManagerDao.gradleList(params);
 }

 @Override
public List<GradleMember> gradleBusker(Paging paging) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("paging", paging);
  return memberManagerDao.gradleBusker(params);
}
 
 @Override
public List<GradleMember> gradleSupporter(Paging paging) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("paging", paging);
   return memberManagerDao.gradleSupporter(params);
}
 
 
 @Override
 public List<GradleMember> gradleAjaxBusker(Paging paging) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("paging", paging);
   return memberManagerDao.gradleBusker(params);
 }

 @Override
 public List<GradleMember> gradleAjaxSupporter(Paging paging) {
   HashMap<String,Object> params = new HashMap<>();
   params.put("paging", paging);
   return memberManagerDao.gradleSupporter(params);
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
public List<GradleMember> gradleSelect(String flag, String text, int type) {
  Map<String,Object> params = new HashMap<>();
  params.put("flag", flag);
  params.put("text", text);
  params.put("type", type);
  return memberManagerDao.gradleAjaxBuskerSelect(params);
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
  Map<String,Object> params = new HashMap<>();
  params.put("flag", flag);
  return memberManagerDao.totlistFlag(params);
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


@Override
public int totgradle() {
  return memberManagerDao.totgradle();
}

@Override
public int totgradleAjaxSupporter() {
  return memberManagerDao.totgradleAjaxBusker();
}

@Override
public int totgradleAjaxBusker() {
  return memberManagerDao.totgradleAjaxSupporter();
}

@Override
public Integer fingFlag(String flag, String text) {
  Map<String,Object> params = new HashMap<>();
  params.put("flag", flag);
  params.put("text", text);
  Integer f = memberManagerDao.fingFlag(params);
  if(f == null || f == 0) {
    return 0;
  }else {
    return f;
  }
}

@Override
public int totdateSelect(String flag, String text, String cdt1, String cdt2) {
  Map<String,Object> params = new HashMap<>();
  params.put("flag", flag);
  params.put("cdt1", cdt1);
  params.put("cdt2", cdt2);
  return memberManagerDao.totsearchSelect(params);
}

}
