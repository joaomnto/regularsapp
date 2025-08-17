const admin = require("firebase-admin/app");
admin.initializeApp();

const addmessage = require("./addmessage.js");
exports.addmessage = addmessage.addmessage;
