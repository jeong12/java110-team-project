package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.BuskerSchedule;

public interface BuskerScheduleService {
    List<BuskerSchedule> mybslist(int pageNo, int pageSize);
}
