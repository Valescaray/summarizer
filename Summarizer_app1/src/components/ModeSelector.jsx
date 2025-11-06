export default function ModeSelector({ mode, setMode }) {
  return (
    <div className="mb-4">
      <label className="mr-4">
        <input
          type="radio"
          value="summarize"
          checked={mode === "summarize"}
          onChange={(e) => setMode(e.target.value)}
        />{" "}
        Summarize
      </label>
      <label>
        <input
          type="radio"
          value="paraphrase"
          checked={mode === "paraphrase"}
          onChange={(e) => setMode(e.target.value)}
        />{" "}
        Paraphrase
      </label>
    </div>
  );
}
