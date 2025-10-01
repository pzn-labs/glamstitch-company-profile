<script lang="ts">
	import '../app.css';
	import { onMount } from 'svelte';
	
	let isDark = $state(false);
	
	onMount(() => {
	  const storedDark = localStorage.getItem('theme') === 'dark';
	  isDark = storedDark;
	  
	  const isSystemDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
	  isDark = isSystemDarkMode || isDark; 
	  document.documentElement.classList.toggle('dark', isDark);
	  
	  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
		isDark = e.matches;
		document.documentElement.classList.toggle('dark', isDark);
	  });
	});
	
	function toggleDarkMode() {
	  isDark = !isDark;
	  document.documentElement.classList.toggle('dark', isDark);
	  localStorage.setItem('theme', isDark ? 'dark' : 'light');
	}
  
	let { children } = $props();
</script>

<style>
	/* Smooth scrolling */
	:global(html) {
		scroll-behavior: smooth;
	}
</style>

{@render children()}
  
<!-- Navbar -->
<nav class="fixed top-4 inset-x-0 z-50 px-4">
	<div class="mx-auto max-w-7xl px-6 py-3 bg-white/95 dark:bg-gray-900/95 backdrop-blur-md shadow-xl rounded-2xl border border-gray-200/50 dark:border-gray-700/50 flex items-center justify-between transition-all duration-300">
		<!-- Logo -->
		<a href="/company-profile-sveltekit" class="flex items-center gap-2 group">
			<img src="/assets/image/logo glint.png" alt="Glam Stitch Logo" class="h-12 w-12 object-contain transition-transform group-hover:scale-110 group-hover:rotate-3">
			<span class="hidden sm:block text-xl font-bold text-gray-900 dark:text-white">Glam Stitch</span>
		</a>

		<!-- Desktop Navigation -->
		<div class="hidden lg:flex items-center space-x-1">
			<a href="/company-profile-sveltekit" class="px-4 py-2 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all font-medium">
				Home
			</a>

			<!-- Products Dropdown -->
			<div class="relative group">
				<button class="px-4 py-2 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all font-medium flex items-center gap-1">
					<span>Products</span>
					<svg class="w-4 h-4 transition-transform group-hover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</button>
				<div class="absolute left-0 top-full mt-2 w-48 bg-white dark:bg-gray-800 rounded-xl shadow-xl border border-gray-200 dark:border-gray-700 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 overflow-hidden">
					<a href="/company-profile-sveltekit/tshirt" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">T-Shirt</a>
					<a href="/company-profile-sveltekit/jacket" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">Jacket</a>
					<a href="/company-profile-sveltekit/shirts" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">Shirts</a>
				</div>
			</div>

			<a href="/company-profile-sveltekit/services" class="px-4 py-2 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all font-medium">
				Services
			</a>

			<!-- Discover Us Dropdown -->
			<div class="relative group">
				<button class="px-4 py-2 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all font-medium flex items-center gap-1">
					<span>Discover</span>
					<svg class="w-4 h-4 transition-transform group-hover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</button>
				<div class="absolute left-0 top-full mt-2 w-52 bg-white dark:bg-gray-800 rounded-xl shadow-xl border border-gray-200 dark:border-gray-700 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 overflow-hidden">
					<a href="/company-profile-sveltekit/about-us" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">About Us</a>
					<a href="/company-profile-sveltekit/blog" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">Blog</a>
					<a href="/company-profile-sveltekit/contact-us" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">Contact Us</a>
					<a href="/company-profile-sveltekit/store-location" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">Store Location</a>
					<a href="/company-profile-sveltekit/gallery" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-700 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">Gallery</a>
				</div>
			</div>
		</div>

		<!-- Right Side Actions -->
		<div class="flex items-center gap-2">
			<!-- Dark Mode Toggle Button -->
			<button 
				onclick={toggleDarkMode}
				class="p-2 rounded-lg bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 transition-all duration-300 group"
				aria-label="Toggle dark mode"
			>
				{#if isDark}
					<!-- Sun Icon -->
					<svg class="w-5 h-5 text-yellow-500 group-hover:rotate-180 transition-transform duration-500" fill="currentColor" viewBox="0 0 20 20">
						<path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd" />
					</svg>
				{:else}
					<!-- Moon Icon -->
					<svg class="w-5 h-5 text-gray-700 group-hover:-rotate-12 transition-transform duration-500" fill="currentColor" viewBox="0 0 20 20">
						<path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z" />
					</svg>
				{/if}
			</button>

			<!-- Mobile Menu Toggle -->
			<label for="menu-toggle" class="lg:hidden p-2 rounded-lg bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 transition-all cursor-pointer">
				<svg class="w-6 h-6 text-gray-900 dark:text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
				</svg>
			</label>
		</div>
	</div>
</nav>
  
<!-- Toggle Checkbox -->
<input type="checkbox" id="menu-toggle" class="peer hidden" autocomplete="off" />

<!-- Mobile Menu Panel -->
<div class="fixed inset-0 z-40 lg:hidden">
	<!-- Backdrop -->
	<div class="fixed inset-0 bg-black/50 backdrop-blur-sm opacity-0 peer-checked:opacity-100 transition-opacity duration-300 pointer-events-none peer-checked:pointer-events-auto"></div>
	
	<!-- Menu Panel -->
	<div class="fixed top-0 right-0 h-full w-80 max-w-[85vw] bg-white dark:bg-gray-900 shadow-2xl transform translate-x-full peer-checked:translate-x-0 transition-transform duration-300 ease-out overflow-y-auto">
		<!-- Header -->
		<div class="flex items-center justify-between p-6 border-b border-gray-200 dark:border-gray-800">
			<div class="flex items-center gap-2">
				<img src="/assets/image/logo glint.png" alt="Logo" class="h-10 w-10" />
				<span class="text-lg font-bold text-gray-900 dark:text-white">Glam Stitch</span>
			</div>
			<label for="menu-toggle" class="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors cursor-pointer">
				<svg class="w-6 h-6 text-gray-900 dark:text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
				</svg>
			</label>
		</div>

		<!-- Navigation -->
		<nav class="p-4 space-y-2">
			<a href="/company-profile-sveltekit" class="block px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium transition-all">
				🏠 Home
			</a>

			<!-- Products Dropdown -->
			<div class="space-y-1">
				<input type="checkbox" id="mobile-products" class="peer hidden" />
				<label for="mobile-products" class="flex items-center justify-between px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium cursor-pointer transition-all">
					<span>🛍️ Products</span>
					<svg class="w-5 h-5 transition-transform peer-checked:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</label>
				<div class="overflow-hidden max-h-0 peer-checked:max-h-48 transition-all duration-300 ml-4 space-y-1">
					<a href="/company-profile-sveltekit/tshirt" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						T-Shirt
					</a>
					<a href="/company-profile-sveltekit/jacket" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Jacket
					</a>
					<a href="/company-profile-sveltekit/shirts" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Shirts
					</a>
				</div>
			</div>

			<a href="/company-profile-sveltekit/services" class="block px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium transition-all">
				⚡ Services
			</a>

			<!-- Discover Dropdown -->
			<div class="space-y-1">
				<input type="checkbox" id="mobile-discover" class="peer hidden" />
				<label for="mobile-discover" class="flex items-center justify-between px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium cursor-pointer transition-all">
					<span>🔍 Discover</span>
					<svg class="w-5 h-5 transition-transform peer-checked:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</label>
				<div class="overflow-hidden max-h-0 peer-checked:max-h-64 transition-all duration-300 ml-4 space-y-1">
					<a href="/company-profile-sveltekit/about-us" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						About Us
					</a>
					<a href="/company-profile-sveltekit/blog" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Blog
					</a>
					<a href="/company-profile-sveltekit/contact-us" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Contact Us
					</a>
					<a href="/company-profile-sveltekit/store-location" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Store Location
					</a>
					<a href="/company-profile-sveltekit/gallery" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Gallery
					</a>
				</div>
			</div>
		</nav>

		<!-- Footer in Mobile Menu -->
		<div class="p-6 border-t border-gray-200 dark:border-gray-800 mt-4">
			<p class="text-sm text-gray-500 dark:text-gray-400 text-center">© 2025 Glam Stitch</p>
		</div>
	</div>
</div>
  