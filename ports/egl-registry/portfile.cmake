vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO KhronosGroup/EGL-Registry
  REF c04403c4534e0183100f92f64905e824fb6b137e
  SHA512 03589cb500997d75e9bdc63f9dc9eac00acda9d41183f8b3151c0e9298796b079ee81fd051194c08d04f5fd421a6d915144aa567e4f18d9b4b18635258f17086
  HEAD_REF master
)

file(
  COPY
    "${SOURCE_PATH}/api/KHR"
    "${SOURCE_PATH}/api/EGL"
  DESTINATION "${CURRENT_PACKAGES_DIR}/include"
)

file(
  COPY
    "${SOURCE_PATH}/api/egl.xml"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/opengl"
)

file(
  INSTALL "${SOURCE_PATH}/sdk/docs/man/copyright.xml"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)
