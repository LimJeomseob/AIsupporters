// Supabase 접속 정보를 브라우저에 전달 (값은 Vercel 환경 변수에 둠)
module.exports = (req, res) => {
  res.setHeader('Cache-Control', 'no-store');
  res.status(200).json({
    url: process.env.SUPABASE_URL || '',
    anonKey: process.env.SUPABASE_ANON_KEY || '',
  });
};
