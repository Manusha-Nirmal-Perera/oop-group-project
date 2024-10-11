package com.company.Repository;

import com.company.modal.User;

public interface UserServiceRepository {
	User userLogin(String email, String password);
	boolean userRegister(User user);
	boolean ChangePassword(int userId, String newPassword);
	boolean editUserInfo(User user);
}
