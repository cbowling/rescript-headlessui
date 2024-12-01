import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': '/lib/es6/src' // Optional: Alias for cleaner imports
    },
    extensions: ['.js', '.res.js'], // Ensure Vite recognizes `.res.js`
  },
  optimizeDeps: {
    esbuildOptions: {
      target: 'esnext', // Ensure compatibility with ES modules
    },
  },
  server: {
    open: true, // Automatically opens the browser
  }
});
