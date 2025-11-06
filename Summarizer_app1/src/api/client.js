export const processText = async (text, mode) => {
  const response = await fetch(
    `${import.meta.env.VITE_APP_URL}/process-text`,
    {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ text, mode }),
    }
  );
  if (!response.ok) throw new Error("Failed to process text");
  return await response.json();
};
