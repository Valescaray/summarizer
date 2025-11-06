import { useState } from "react";
import { processText } from "./api/client";
import TextInput from "./components/TextInput";
import ModeSelector from "./components/ModeSelector";
import OutputArea from "./components/OutputArea";

export default function App() {
  const [text, setText] = useState("");
  const [mode, setMode] = useState("summarize");
  const [output, setOutput] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async () => {
    if (!text.trim()) return;
    setLoading(true);
    try {
      const result = await processText(text, mode);
      setOutput(result.output);
    } catch (err) {
      setOutput(`❌ Error: ${err.message}`);
    }
    setLoading(false);
  };

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col items-center p-8">
      <h1 className="text-3xl font-bold mb-6 text-gray-800">
        Summarizer & Paraphraser App
      </h1>

      <ModeSelector mode={mode} setMode={setMode} />
      <TextInput text={text} setText={setText} />
      <button
        onClick={handleSubmit}
        className="px-6 py-2 bg-blue-600 text-white rounded-lg shadow-md hover:bg-blue-700"
      >
        {loading ? "Processing..." : "Run"}
      </button>
      <OutputArea output={output} />
    </div>
  );
}
