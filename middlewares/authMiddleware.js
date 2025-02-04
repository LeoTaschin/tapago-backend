const jwt = require("jsonwebtoken");

const JWT_SECRET = "seu_segredo_super_secreto"; // 🚨 Troque isso por uma variável de ambiente!

module.exports = (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    return res.status(401).json({ error: "Token não fornecido." });
  }

  const token = authHeader.split(" ")[1];

  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    req.userId = decoded.userId;
    next();
  } catch (error) {
    return res.status(401).json({ error: "Token inválido." });
  }
};
