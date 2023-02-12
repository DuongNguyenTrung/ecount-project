package com.fpt.ecount_swp391.mapper;

import com.fpt.ecount_swp391.dto.UserDto;
import com.fpt.ecount_swp391.model.User;
import javax.annotation.processing.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-02-07T21:27:47+0700",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 11.0.16.1 (Eclipse Adoptium)"
)
public class UserMapperImpl implements UserMapper {

    @Override
    public UserDto toUserDto(User u) {
        if ( u == null ) {
            return null;
        }

        UserDto.UserDtoBuilder userDto = UserDto.builder();

        userDto.userId( u.getUserId() );
        userDto.username( u.getUsername() );
        userDto.fullname( u.getFullname() );
        userDto.gender( u.getGender() );
        userDto.address( u.getAddress() );
        userDto.phone( u.getPhone() );
        userDto.role( u.getRole() );
        userDto.status( u.getStatus() );

        return userDto.build();
    }
}

