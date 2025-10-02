# PowerShell script to fix base paths in all Svelte pages

$pages = @(
    "src/routes/blog/+page.svelte",
    "src/routes/contact-us/+page.svelte", 
    "src/routes/gallery/+page.svelte",
    "src/routes/jacket/+page.svelte",
    "src/routes/product/+page.svelte",
    "src/routes/services/+page.svelte",
    "src/routes/shirts/+page.svelte",
    "src/routes/store-location/+page.svelte",
    "src/routes/tshirt/+page.svelte"
)

foreach ($page in $pages) {
    Write-Host "Processing $page..."
    
    # Read the file content
    $content = Get-Content $page -Raw
    
    # Add import { base } from '$app/paths'; if not already present
    if ($content -notmatch "import.*base.*from.*app/paths") {
        $content = $content -replace '(<script lang="ts">\s*\n\s*// Page content only - dark mode handled by layout)', '$1`n  import { base } from ''$app/paths'';'
    }
    
    # Fix all href links to use base path
    $content = $content -replace 'href="/', 'href="{base}/'
    
    # Write back to file
    Set-Content $page -Value $content -NoNewline
    
    Write-Host "Fixed $page"
}

Write-Host "All pages have been updated with base paths!"
