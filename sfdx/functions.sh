#=============================================================
# SECTION: Source. These are functions dealing with org source
#=============================================================

# Used to create an org
dxorgcreate() {
  DEFINITION_FILE=$1
  TARGET_USERNAME=$2
  sfdx force:org:create --definitionfile=$DEFINITION_FILE --targetusername=$TARGET_USERNAME
}

dxorgdelete() {
  TARGET_USERNAME=$1
  sfdx force:org:delete --targetusername=$TARGET_USERNAME
}

dxorgopen() {
  TARGET_USERNAME=$1
  sfdx force:org:open --targetusername=$TARGET_USERNAME
}

#=============================================================
# SECTION: Source. These are functions dealing with org source
#=============================================================

# Used to pull source from org
dxpull() {
  TARGET_USERNAME=$1
  sfdx force:source:pull --targetusername=$TARGET_USERNAME
}

# Used top push source to org
dxpush() {
  TARGET_USERNAME=$1
  sfdx force:source:push --targetusername=$TARGET_USERNAME
}

#=============================================================
# SECTION: Project. These are functions dealing with project
#=============================================================
dxprojectcreate() {
  PROJECT_NAME=$1
  sfdx force:project:create --projectname=$PROJECT_NAME
}

#=============================================================
# SECTION: Package. These are functions dealing with packages
#=============================================================

# Used to create a package
dxpackagecreate() {
  PACKAGE_NAME=$1
  PACKAGE_TYPE=$2
  PACKAGE_PATH=$3
  TARGET_USERNAME=$4
  sfdx force:package:create --name=$PACKAGE_NAME --type=$PACKAGE_TYPE --path=$PACKAGE_PATH --targetusername=$TARGET_USERNAME
}

# Used to create a paclage version
dxpackageversioncreate() {
  PACKAGE=$1
  WAIT=$2
  
  if [ -z "$WAIT" ]
  then
    sfdx force:package:version:create --package=$PACKAGE -x --wait=$WAIT
  else
    sfdx force:package:version:create --package=$PACKAGE -x
  fi
}

# Used to install a package
dxpackageinstalll() {
  PACKAGE=$1
  WAIT=$2
  TARGET_USERNAME=$2

  if [ -z "$3" ]
  then
    sfdx force:package:install --package=$PACKAGE --targetusername=$TARGET_USERNAME --wait=$WAIT
  else
    sfdx force:package:install --package=$PACKAGE --targetusername=$TARGET_USERNAME
  fi
}
