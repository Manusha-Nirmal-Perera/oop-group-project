package com.company.Repository;

import com.company.modal.Admin;

public interface AdminLoginRepository {
    Admin adminLogin(String email, String password);
}
