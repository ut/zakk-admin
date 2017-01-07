# user
createuser zakk_admin -P

# test / development
createdb zakk_admin_test -E unicode
createdb zakk_admin_development -E unicode

# staging / production
createdb zakk_admin_test -E unicode
createdb zakk_admin4_development -E unicode
