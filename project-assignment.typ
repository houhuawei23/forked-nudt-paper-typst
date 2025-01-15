#import "project-assignment-template.typ": *
#import "info.typ": *

#show: project.with(
  ..info,
  comments: comments
)

#show math.equation: set text(font: "TeX Gyre Termes Math")

#show figure: it => {
    set text(size: 10.5pt)
    it
    v(-1em)
    box()
}
#show figure.where(kind: table): it => [
  #set figure.caption(position: top)
  #it
]

// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

= 课题主要任务与要求

== 课题主要任务

在探讨凌霄宝殿的建筑设计原则与风格时，我们必须首先理解其作为天界至高无上的宫殿，所承载的神圣与庄严@frantar2022optimal。凌霄宝殿不仅是天界政治、文化的中心，更是连接天地、神人的重要纽带。因此，其建筑设计必须体现出至高无上的权威与尊贵，同时还要兼顾实用性与美观性。

== 课题要求

==== 神圣性与权威性：凌霄宝殿的设计必须体现出天界的至高无上，其建筑高度、规模和装饰都要体现出超越凡尘的神圣感。

==== 对称性与和谐性：遵循天界建筑的传统，凌霄宝殿的设计强调对称性，以体现宇宙的秩序与和谐。

==== 实用性与功能性：虽然凌霄宝殿是天界的标志性建筑，但其设计也必须考虑到实际的使用需求，如会议、庆典、接待等。

==== 耐久性与稳固性：考虑到天界的长久存在，凌霄宝殿的建筑材料和结构设计必须能够抵御各种自然灾害，保证长久的稳固。

==== 创新性与时代性：虽然尊重传统，但凌霄宝殿的设计也应融入现代元素，以体现天界与时代同步的发展。

#figure(image("images/sichuan-highway.jpg"), caption: "凌霄宝殿的建筑设计图")

通过这些设计原则和风格的融合，凌霄宝殿不仅成为了天界的标志性建筑，也成为了连接过去与未来、东方与西方、自然与科技的桥梁。它的设计和建造，是对天界建筑艺术的一次伟大尝试，也是对天界文化的一种传承与发展。

= 完成形式

#lorem(50)

== 环境保护与天界可持续发展

#lorem(100)


= 毕业设计（论文）进度安排

#figure(
  table(
  columns: (3em, 2fr, 1fr),
  stroke: 0.5pt + black,
  align: horizon,

  [ 序号 ], [ 毕业设计（论文）各阶段内容 ], [ 时间安排 ],

  [ 1 ],
  table.cell(stroke: orange + 2pt)[
    查阅相关文献资料，积累领域专业知识
  ],
  [ 2025.01.30-2025.02.30 ],

  [ 2 ],
  [ 完成 xx 算法设计与 xx 智能计算框架的适配 ],
  [ 2025.02.30-2025.03.30 ],

  [ 3 ],
  [ 完成 xx 算法的优化与改进 ],
  [ 2025.03.30-2025.04.30 ],

  [ 4 ],
  [ 撰写毕业设计论文，完成毕业答辩 ],
  [ 2025.05.10-2025.06.15 ],

), caption: [ 毕业设计进度安排 ]
)

任务起止时间: 2025.01.30-2025.06.15

#lorem(150)

// 根据内容调整空白的高度，以完全拓展内容区域
// TODO: 不是很优雅，是否有更好的方式？
#v(40em)




