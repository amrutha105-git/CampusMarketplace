package com.campus.dao;

import com.campus.dto.Profile;

public interface ProfileDao {
	
	void addProfile(Profile p);

    void updateProfile(Profile p);

    void deleteProfile(int profileId);
    
}
