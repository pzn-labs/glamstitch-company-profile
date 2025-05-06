import adapter from '@sveltejs/adapter-static';
import path from 'path';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    paths: {
      base: '/company-profile-sveltekit', 
    },
    adapter: adapter({
      pages: path.join(process.cwd(), 'build'),
      assets: path.join(process.cwd(), 'build'),
    }),
  },
};

export default config;
