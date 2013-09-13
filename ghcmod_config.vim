" sandboxing tweak for ghcmod-vim
function! s:find_basedir() "{{{
" search Cabal file
  if !exists('b:ghcmod_basedir')
    let l:ghcmod_basedir = expand('%:p:h')
    let l:dir = l:ghcmod_basedir
    for _ in range(6)
      if !empty(glob(l:dir . '/*.cabal', 0))
        let l:ghcmod_basedir = l:dir
        break
      endif
      let l:dir = fnamemodify(l:dir, ':h')
    endfor
    let b:ghcmod_basedir = l:ghcmod_basedir
  endif
  return b:ghcmod_basedir
endfunction "}}}

" use ghc functionality for haskell files
let sandbox_dir = '/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d'
let g:ghc="/usr/bin/ghc"
augroup filetype_hs
    autocmd!
    autocmd Bufenter *.hs let dir = s:find_basedir() . sandbox_dir
    "autocmd Bufenter *.hs compiler ghc
    autocmd Bufenter *.hs let b:ghc_staticoptions = '-package-db ' . dir
    autocmd Bufenter *.hs let g:ghcmod_ghc_options = ['-package-db ' . dir]
augroup END

autocmd BufWritePost *.hs GhcModCheckAndLintAsync
