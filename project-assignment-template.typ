// #import "@preview/numbly:0.1.0": numbly
#let numbly(..arr, default: "1.") = (..nums) => {
  let arr = arr.pos()
  nums = nums.pos()
  if nums.len() > arr.len() {
    if default == none {
      return none
    }
    if type(default) == function {
      return default(..nums)
    }
    return numbering(default, ..nums)
  }
  let format = arr.at(nums.len() - 1)
  if format == none {
    return none
  }
  if type(format) == function {
    return format(..nums)
  }
  format.replace(
    regex("\{(\d)(:(.+?))?\}"),
    m => {
      let (a, b, c) = m.captures
      if b != none {
        numbering(c, nums.at(int(a) - 1))
      } else {
        str(nums.at(int(a) - 1))
      }
    },
  )
}

#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#let tnr = "Times New Roman"
#let fsong = (tnr, "FangSong")
#let song = (tnr, "SimSun")
#let hei = (tnr, "SimHei")
#let project(
  title: "", 
  name: "", 
  idnum: "", 
  major1: "", 
  major2: "", 
  college: "", 
  grade: "", 
  advisor: "", 
  jobtitle: "", 
  unit:"", 
  comments: "", 
  body) = {
  counter(page).update(0)
  set page(
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 30mm),
  )
  set text(font: ("Times New Roman", "SimSun"), lang: "zh")

  v(80pt)
  // Title row.
  align(center)[
    #block(text(size: 30pt)[*本科毕业设计（论文）任务书*])
  ]
  // Space
  v(120pt)
  align(center)[
    #grid(columns: (3.53fr, 10.82fr), row-gutter: 5pt, 
    [#text(weight: "bold", size: 16pt)[课题名称：]], [#text(weight: "bold", font: fsong, size: 16pt)[#title]], [], [#line(length: 100%, stroke: (thickness: 0.5pt))])
  ]
  v(90pt)
  // Author information.
  grid(
    columns: (0.22fr, 0.29fr, 0.22fr, 0.29fr),
    rows: (14pt, 16pt, 2pt, 14pt, 16pt, 2pt, 14pt, 16pt, 2pt, 14pt, 16pt, 2pt),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "学员姓名")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, name)),
    [#text(size: 14pt, font: song, tracking: 56pt, "学号")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: tnr, idnum)),
    v(14pt),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    // align(center, text(size: 14pt, font: fsong, major1)),
    [#text(size: 14pt, font: song, "首次任职专业")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, major2)),
    text(size: 14pt, font: song, "学历教育专业："),
    align(center, text(size: 14pt, font: fsong, major1)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "命题学院")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, college)),
    [#text(size: 14pt, font: song, tracking: 56pt, "年级")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, grade)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "指导教员")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, advisor)),
    [#text(size: 14pt, font: song, tracking: 56pt, "职称")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, jobtitle)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
  )
  v(-12pt)
  grid(
    columns: (0.22fr, 0.80fr),
    rows: (14pt, 15pt, 8pt),
    text(size: 14pt, ""),
    text(size: 14pt, ""),
    [#text(size: 14pt, font: song, tracking: 9pt, "所属单位")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, unit)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
  )
  v(100pt)
  align(center)[#text(font: hei, size: 16pt)[国防科技大学教育训练部制]]

  set par(spacing: 6pt)
  set par(justify: true, leading: 6pt, first-line-indent: 2em)
  set page(footer: context [
    #let (cur,) = counter(page).get()
    #align(center)[#text(font: tnr, size: 9pt)[#cur]]
  ])
  // headings
  set heading(numbering: (..args) => {
    let nums = args.pos()
    let level = nums.len() - 1
    let label = ("一、", "（一）", "1.", "（1）").at(level)
    let indents = (0em, 2em, 2em, 2em).at(level)
    let fsize = (14pt, 12pt, 12pt, 12pt).at(level)
    [#h(indents)#numbering(label, nums.at(level))]
  })
  
  show heading: it => box(width: 100%)[
    #set text(weight: "regular")
    #counter(heading).display()
    #it.body
  ]
  
  show heading.where(
    level: 1
  ): it => box(width: 100%)[
    #v(-24pt)
    #set text(font: hei, size: 14pt, weight: "regular")
    #it
  ]

  show heading.where(
    level: 2
  ): it => box(width: 100%)[
    #v(-24pt)
    #h(2em)
    #set text(font: hei, size: 12pt, weight: "regular")
    #it
  ]

  show heading.where(
    level: 3
  ): it => box(width: 100%)[
    #v(-24pt)
    #h(2em)
    #set text(font: hei, size: 12pt, weight: "regular")
    #it
  ]
  show heading.where(
    level: 4
  ): it => box(width: 100%)[
    #v(-24pt)
    #h(2em)
    #set text(font: song, size: 12pt, weight: "regular")
    #it
  ]
  
  // main body pages
  pagebreak()
  set text(size: 12pt)
  set par(spacing: 12pt) // for newer typst version
  set par(justify: true, leading: 12pt, first-line-indent: 2em)

  // add border to the main body
  block(
    width: 100%, 
    stroke: (thickness: 0.5pt), 
    inset: 15pt, 
    breakable: true, 
  )[#body]
  pagebreak()

  block(
    width: 100%, 
    stroke: (thickness: 0.5pt), 
    inset: 15pt, 
    breakable: true, 
  )[
    #align(center)[#text(size: 16pt, font: hei)[参考文献]]
    #v(16pt)
    #set text(size: 10.5pt)
    #bibliography("references.bib", style: "gb-7714-2015-numeric", title:none)
    // 根据内容调整空白的高度，以完全拓展内容区域
    // TODO: 不是很优雅，是否有更好的方式？
    #v(50em)
    #text(font: song, size: 12pt)[#h(2em)指导教员签名：#h(15em)年#h(2em)月#h(2em)日]
  ]

  // final page
  pagebreak()
  set par(spacing: 6pt) // for newer typst version
  set par(justify: true, leading: 6pt, first-line-indent: 0em)
  grid(
    block(stroke: (thickness:0.5pt), width: 100%, height: 218pt, inset: 6pt)[
      #text(font: hei, size: 12pt)[教研室（研究室、实验室）意见：]
      #v(150pt)
      #text(font: song, size: 12pt)[#h(2em)领导签名：#h(20em)年#h(2em)月#h(2em)日]
    ], 
    block(stroke: (thickness:0.5pt), width: 100%, height: 218pt, inset: 6pt)[
      #text(font: hei, size: 12pt)[系（研究所、重点实验室）意见：]
      #v(150pt)
      #text(font: song, size: 12pt)[#h(2em)领导签名：#h(20em)年#h(2em)月#h(2em)日]
    ], 
    block(stroke: (thickness:0.5pt), width: 100%, height: 218pt, inset: 6pt)[
      #text(font: hei, size: 12pt)[学院教学科研处（教务处）意见：]
      #v(120pt)
      #text(font: song, size: 12pt)[#h(27em)（公章）]
      #v(12pt)
      #text(font: song, size: 12pt)[#h(27em)年#h(2em)月#h(2em)日]
    ]
  )
  text(font: song, size: 10.5pt)[
    注：任务书由指导教员填写，经各级审核后下达给学员，答辩结束后由指导教员交系（所、室）。
  ]
}