const admin = require("firebase-admin/app");
admin.initializeApp();

const setUserLowercaseName = require("./set_user_lowercase_name.js");
exports.setUserLowercaseName = setUserLowercaseName.setUserLowercaseName;
