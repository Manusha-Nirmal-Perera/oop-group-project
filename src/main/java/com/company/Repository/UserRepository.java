package com.company.Repository;

import java.util.List;

import com.company.modal.User;

public interface UserRepository {
	 List<User> getAllUsers();
	 boolean deleteUser(int userId);
	 User getUserByID(int userId);
	 int getUserCount();
	 boolean updateUser(int userID, String fName, String lName, String email, String phone);
}
