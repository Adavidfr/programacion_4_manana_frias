// data/remote/api/UserApi.kt
package com.shopapp.data.remote.api

import com.shopapp.data.remote.dto.*
import retrofit2.http.*
import okhttp3.MultipartBody

interface UserApi {
    @GET("users/")
    suspend fun getUsers(
        @Query("search")    search:   String?  = null,
        @Query("is_staff")  isStaff:  Boolean? = null,
        @Query("is_active") isActive: Boolean? = null,
        @Query("page")      page:     Int?     = null,
    ): retrofit2.Response<PaginatedDto<UserDto>>

    @GET("users/{id}/")
    suspend fun getUser(@Path("id") id: Int): retrofit2.Response<UserDto>

    @POST("users/")
    suspend fun createUser(@Body body: UserRequestDto): retrofit2.Response<UserDto>

    @PATCH("users/{id}/")
    suspend fun updateUser(
        @Path("id") id: Int,
        @Body body: UserRequestDto,
    ): retrofit2.Response<UserDto>

    @DELETE("users/{id}/")
    suspend fun deleteUser(@Path("id") id: Int): retrofit2.Response<Unit>

    @POST("users/{id}/toggle-active/")
    suspend fun toggleActive(@Path("id") id: Int): retrofit2.Response<ToggleActiveResponseDto>

    @GET("users/profile/")
    suspend fun getProfile(): retrofit2.Response<UserDto>

    @GET("users/stats/")
    suspend fun getStats(): retrofit2.Response<UserStatsDto>

    @Multipart
    @PATCH("users/profile/")
    suspend fun uploadAvatar(
        @Part avatar: MultipartBody.Part,
    ): retrofit2.Response<UserDto>
}
