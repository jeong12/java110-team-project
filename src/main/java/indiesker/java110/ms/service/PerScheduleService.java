package indiesker.java110.ms.service;

import java.util.List;
import indiesker.java110.ms.domain.PerSchedule;

public interface PerScheduleService {
    List<PerSchedule> list(int pageNo, int pageSize);
}
