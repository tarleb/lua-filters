github-math
===========

GitHub does not support LaTeX-math in Markdown, but offers a
rendering service which can create images from LaTeX strings
passed as query parameters. This filter converts math elements
into images, which will be generated through GitHub's service.

The main use-case for this filter is to produce files for
rendering by GitHub, e.g. `README.md`. Combine with output format
`gfm` for best results.

Example
-------

Let's assume we have written a math-heavy library and want to put
it on GitHub. The documentation contains many math formulas, like
so:

    The Manhattan norm (or $L^1$ norm) is defined as
    $$\|v\|_1 = \sum_{i = 1}^n \left|v_i\right|$$.


Using this filter to transforms the document into GitHub Flavored
Markdown (gfm), all math expressions are replaced by images, like
so:

    The Manhattan norm (or
    ![L^1](https://render.githubusercontent.com/render/math?math=L^1&mode=inline)
    norm) is defined as ![\\|v\\|\_1 = \\sum\_{i = 1}^n
    \\left|v\_i\\right|](https://render.githubusercontent.com/render/math?math=%5C|v%5C|_1%20%3D%20%5Csum_{i%20%3D%201}^n%20%5Cleft|v_i%5Cright|&mode=display)

Demo:

> The Manhattan norm (or
> ![L^1](https://render.githubusercontent.com/render/math?math=L^1&mode=inline)
> norm) is defined as ![\\|v\\|\_1 = \\sum\_{i = 1}^n
> \\left|v\_i\\right|](https://render.githubusercontent.com/render/math?math=%5C|v%5C|_1%20%3D%20%5Csum_{i%20%3D%201}^n%20%5Cleft|v_i%5Cright|&mode=display)


License
-------

Copyright © 2020 Albert Krewinkel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
