export default function TextInput({ text, setText }) {
  return (
    <textarea
      className="w-full max-w-2xl h-48 p-4 border border-gray-300 rounded-lg mb-4"
      placeholder="Paste your text here..."
      value={text}
      onChange={(e) => setText(e.target.value)}
    />
  );
}
