<script lang="ts">
	import '../app.css';
	import { onMount } from 'svelte';
	import { base } from '$app/paths';
	import logoGlint from '$lib/assets/image/logo glint.png';
	
	let isDark = $state(false);
	let isTransitioning = $state(false);
	
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
	<div class="mx-auto max-w-7xl px-6 py-3 bg-white/95 dark:bg-gray-900/95 backdrop-blur-md shadow-xl rounded-full border border-gray-200/50 dark:border-gray-700/50 flex items-center justify-between transition-all duration-300">
		<!-- Logo -->
		<a href="{base}/" class="flex items-center gap-2 group">
			<img src={logoGlint} alt="Glam Stitch Logo" class="h-12 w-12 object-contain transition-transform group-hover:scale-110 group-hover:rotate-3">
			<span class="hidden sm:block text-xl font-semibold text-gray-900 dark:text-white">Glam Stitch</span>
		</a>

		<!-- Enhanced Desktop Navigation -->
		<div class="hidden lg:flex items-center space-x-2">
			<a href="{base}/" class="px-4 py-2 rounded-xl text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-300 font-medium">
				<span class="relative z-10">Beranda</span>
			</a>

			<!-- Enhanced Products Dropdown -->
			<div class="relative group">
				<button class="px-4 py-2 rounded-xl text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-300 font-medium flex items-center gap-2">
					<span class="relative z-10">Produk</span>
					<svg class="w-4 h-4 transition-transform duration-300 group-hover:rotate-180 relative z-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</button>
				<div class="absolute left-0 top-full mt-3 w-52 bg-white/95 dark:bg-gray-800/95 backdrop-blur-xl rounded-2xl shadow-2xl border border-gray-200/50 dark:border-gray-700/50 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 overflow-hidden transform scale-95 group-hover:scale-100">
					<div class="p-2 space-y-1">
						<a href="{base}/tshirt" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Kaos</a>
						<a href="{base}/polo" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Kaos Polo</a>
						<a href="{base}/jersey" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Jersey</a>
						<a href="{base}/jacket" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Jaket</a>
						<a href="{base}/shirts" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Kemeja</a>
					</div>
				</div>
			</div>

			<a href="{base}/services" class="px-4 py-2 rounded-xl text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-300 font-medium">
				<span class="relative z-10">Layanan</span>
			</a>

			<!-- Enhanced Discover Us Dropdown -->
			<div class="relative group">
				<button class="px-4 py-2 rounded-xl text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-300 font-medium flex items-center gap-2">
					<span class="relative z-10">Jelajahi</span>
					<svg class="w-4 h-4 transition-transform duration-300 group-hover:rotate-180 relative z-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</button>
				<div class="absolute left-0 top-full mt-3 w-56 bg-white/95 dark:bg-gray-800/95 backdrop-blur-xl rounded-2xl shadow-2xl border border-gray-200/50 dark:border-gray-700/50 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 overflow-hidden transform scale-95 group-hover:scale-100">
					<div class="p-2 space-y-1">
						<a href="{base}/about-us" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Tentang Kami</a>
						<a href="{base}/blog" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Blog</a>
						<a href="{base}/faq" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">FAQ</a>
						<a href="{base}/contact-us" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Hubungi Kami</a>
						<a href="{base}/store-location" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Lokasi Toko</a>
						<a href="{base}/gallery" class="block px-4 py-3 text-gray-700 dark:text-gray-200 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-200 rounded-xl font-medium">Galeri</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Enhanced Right Side Actions -->
		<div class="flex items-center gap-3">
			<!-- Enhanced Dark Mode Toggle Button -->
			<button 
				onclick={toggleDarkMode}
				class="relative p-3 rounded-xl hover:text-indigo-600 dark:hover:text-indigo-400 transition-all duration-300 group overflow-hidden"
				aria-label="Toggle dark mode"
			>
				{#if isDark}
					<svg class="w-5 h-5 text-yellow-500 relative z-10 transition-transform duration-300 group-hover:scale-110 group-hover:rotate-12" fill="currentColor" viewBox="0 0 20 20">
						<path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd" />
					</svg>
				{:else}
					<svg class="w-5 h-5 text-indigo-600 dark:text-indigo-400 relative z-10 transition-transform duration-300 group-hover:scale-110 group-hover:-rotate-12" fill="currentColor" viewBox="0 0 20 20">
						<path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z" />
					</svg>
				{/if}
			</button>

			<!-- Mobile Menu Toggle -->
			<label for="menu-toggle" class="lg:hidden p-2 rounded-lg hover:bg-gray-200 dark:hover:bg-gray-700 transition-all cursor-pointer">
				<svg class="w-6 h-6 text-gray-900 dark:text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
				</svg>
			</label>
		</div>
	</div>
</nav>
  
<!-- Mobile Menu Container -->
<div class="lg:hidden">
	<!-- Toggle Checkbox -->
	<input type="checkbox" id="menu-toggle" class="peer hidden" autocomplete="off" />

	<!-- Backdrop -->
	<label for="menu-toggle" class="fixed inset-0 z-40 bg-black/50 backdrop-blur-sm opacity-0 invisible peer-checked:opacity-100 peer-checked:visible transition-all duration-300 cursor-pointer"></label>
	
	<!-- Menu Panel -->
	<div class="fixed top-0 right-0 h-full w-80 max-w-[85vw] z-50 bg-white dark:bg-gray-900 shadow-2xl transform translate-x-full peer-checked:translate-x-0 transition-transform duration-300 ease-out overflow-y-auto">
		<!-- Header -->
		<div class="flex items-center justify-between p-6 border-b border-gray-200 dark:border-gray-800">
			<div class="flex items-center gap-2">
				<img src={logoGlint} alt="Logo" class="h-10 w-10" />
				<span class="text-lg font-semibold text-gray-900 dark:text-white">Glam Stitch</span>
			</div>
			<label for="menu-toggle" class="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors cursor-pointer">
				<svg class="w-6 h-6 text-gray-900 dark:text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
				</svg>
			</label>
		</div>

		<!-- Navigation -->
		<nav class="p-4 space-y-2">
			<a href="{base}/" class="block px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium transition-all">
				Beranda
			</a>

			<!-- Products Dropdown -->
			<div>
				<input type="checkbox" id="mobile-products" class="peer/products hidden" />
				<label for="mobile-products" class="flex items-center justify-between px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium cursor-pointer transition-all">
					<span>Produk</span>
					<svg class="w-5 h-5 transition-transform peer-checked/products:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</label>
				<div class="overflow-hidden max-h-0 peer-checked/products:max-h-72 transition-all duration-300 ml-4 space-y-1">
					<a href="{base}/tshirt" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Kaos
					</a>
					<a href="{base}/polo" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Kaos Polo
					</a>
					<a href="{base}/jersey" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Jersey
					</a>
					<a href="{base}/jacket" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Jaket
					</a>
					<a href="{base}/shirts" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Kemeja
					</a>
				</div>
			</div>

			<a href="{base}/services" class="block px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium transition-all">
				Layanan
			</a>

			<!-- Discover Dropdown -->
			<div>
				<input type="checkbox" id="mobile-discover" class="peer/discover hidden" />
				<label for="mobile-discover" class="flex items-center justify-between px-4 py-3 rounded-lg text-gray-700 dark:text-gray-200 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 font-medium cursor-pointer transition-all">
					<span>Jelajahi</span>
					<svg class="w-5 h-5 transition-transform peer-checked/discover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
					</svg>
				</label>
				<div class="overflow-hidden max-h-0 peer-checked/discover:max-h-64 transition-all duration-300 ml-4 space-y-1">
					<a href="{base}/about-us" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Tentang Kami
					</a>
					<a href="{base}/faq" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						FAQ
					</a>
					<a href="{base}/contact-us" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Hubungi Kami
					</a>
					<a href="{base}/store-location" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Lokasi Toko
					</a>
					<a href="{base}/gallery" class="block px-4 py-2 rounded-lg text-gray-600 dark:text-gray-300 hover:bg-indigo-50 dark:hover:bg-gray-800 hover:text-indigo-600 dark:hover:text-indigo-400 transition-all">
						Galeri
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
  
