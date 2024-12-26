---
aside: false
---

# Average escape for each serum group

The interactive plot below shows the escape caused by mutations for each of the four groups of sera, after averaging across the individual sera in each group.
You can click on the box in the upper-right to expand the plot, or [click here for standalone plot](htmls/sera_group_avgs_overlaid.html){target="_self"}.

The lineplots summarize the escape at each site for each sera group (you can use the interactive option at bottom to summarize the effects of mutations at each site as the sum, mean, etc).
The heatmaps then show the effects of all measured individual mutations on escape from each sera group, as well as the effects of the mutations on spike-mediated entry in 293T-ACE2 cells and full-spike ACE2 binding as measured in [Dadonaite et al (2024)](https://www.nature.com/articles/s41586-024-07636-1).
Light gray indicates mutations not measured, and dark gray indicates mutations that are highly deleterious for spike-mediated entry or ACE2 binding (the sliders below the plot allow you to adjust what threshold is required for a mutation to be considered deleterious).
You can mouseover individual points for details, and zoom into specific sites using the zoom bar at top.
An option at the bottom (`floor escape at zero`) allows you to choose whether to only show effects that escape neutralization, or also show "negative escape" (mutations that increase neutralization).


<Figure caption="Average escape for each serum group">
    <Altair :showShadow="true" :spec-url="'htmls/sera_group_avgs_overlaid.html'"></Altair>
</Figure>

