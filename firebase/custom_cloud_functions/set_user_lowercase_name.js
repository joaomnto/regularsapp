const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.setUserLowercaseName = functions.auth.user().onCreate(async (user) => {
  const uid = user.uid;
  const displayName = user.displayName || "";
  const lower = displayName
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "") // strip accents
    .toLowerCase();

  await admin
    .firestore()
    .doc(`Users/${uid}`)
    .set(
      {
        displayName,
        displayName_lowercase: lower,
        email: user.email || "",
        photoUrl: user.photoURL || "",
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      },
      { merge: true },
    );
});
