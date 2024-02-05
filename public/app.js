// app.js
// Dummy data for demonstration
const data = [
  { category: 'Category A', value: 30 },
  { category: 'Category B', value: 50 },
  { category: 'Category C', value: 20 },
];

// D3.js code for the dashboard
const svg = d3.select("#dashboard")
  .append("svg")
  .attr("width", 400)
  .attr("height", 200);

// Create bars based on data
svg.selectAll("rect")
  .data(data)
  .enter()
  .append("rect")
  .attr("x", (d, i) => i * 120)
  .attr("y", d => 200 - d.value * 2)
  .attr("width", 100)
  .attr("height", d => d.value * 2)
  .attr("fill", "blue");

// Add labels
svg.selectAll("text")
  .data(data)
  .enter()
  .append("text")
  .attr("x", (d, i) => i * 120 + 50)
  .attr("y", d => 200 - d.value * 2 - 5)
  .attr("text-anchor", "middle")
  .text(d => d.value);
