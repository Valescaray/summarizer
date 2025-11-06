export default function OutputArea({ output }) {
  return (
    <div className="w-full max-w-2xl mt-6 p-4 bg-white border rounded-lg shadow-sm">
      <h2 className="text-lg font-semibold mb-2">Result:</h2>
      <p className="whitespace-pre-wrap">{output}</p>
    </div>
  );
}
