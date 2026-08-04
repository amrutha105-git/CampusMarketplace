package com.campus.dao;

import com.campus.dto.Profile;

public interface ProfileDao {

	void addProfile(Profile pr);

    void updateProfile(Profile pr);

    void deleteProfile(int profileId);

    Profile getProfileByUserId(int userId);

}
