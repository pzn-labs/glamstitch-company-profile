import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

const dev = process.argv.includes('dev');

export default {
  preprocess: vitePreprocess(),

  kit: {
    adapter: adapter(),
    paths: {
      // nama repo kamu
      base: dev ? '' : '/glamstitch-company-profile'
    },
    alias: {
      $components: 'src/components',
      $lib: 'src/lib'
    }
  }
};
