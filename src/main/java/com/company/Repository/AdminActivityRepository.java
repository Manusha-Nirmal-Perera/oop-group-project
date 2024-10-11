package com.company.Repository;

import com.company.modal.AdminActivity;
import java.util.List;

public interface AdminActivityRepository {
    boolean insetIntoAdminActivity(AdminActivity adAct);
    List<AdminActivity> getAllAdminActivity();
}