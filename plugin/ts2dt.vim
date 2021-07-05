" ts2dt.vim - convert timestamp to datetime and vise versa
"
" Copyright July 2020 by latavin243 <arvin.qguo@outlook.com>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :TS2DT 1625155200
" :DT2TS 2021-07-02 19:22:30

" TS2DT converts timestamp to datetime
command! -nargs=+ TS2DT :call TS2DT(<f-args>)

function! TS2DT(timestamp)
python3 << endOfPython

import vim
from datetime import datetime

a_ts = vim.eval('a:timestamp')
dt_object = datetime.fromtimestamp(int(a_ts))
print(f'datetime: {dt_object}')

endOfPython
endfunction

" DT2TS converts datetime to timestamp
command! -nargs=+ DT2TS :call DT2TS(<f-args>)

function! DT2TS(date_seg, time_seg)
python3 << endOfPython

import vim
from datetime import datetime

a_date_seg = vim.eval('a:date_seg')
a_time_seg = vim.eval('a:time_seg')
dt_str = f'{a_date_seg} {a_time_seg}'
dt = datetime.strptime(dt_str, "%Y-%m-%d %H:%M:%S")
timestamp = int(datetime.timestamp(dt))
print(f'timestamp: {timestamp}')

endOfPython
endfunction
