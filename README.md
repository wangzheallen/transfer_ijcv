<p>this is the release code for <strong>Transferring Object-Scene Convolutional Neural Networks for Event Recognition in Still Images</strong>:</p>

<pre><code>Transferring Object-Scene Convolutional Neural Networks for Event Recognition in Still Images
Limin Wang, Zhe Wang, Yu Qiao and Luc Van Gool, http://arxiv.org/abs/1609.00162
</code></pre>
<p>The performance is as below: </p> 
<table><thead>
<tr>
<th align="center">   </th>
<th align="center">ChaLearn</th>
<th align="center">WIDER</th>
<th align="center">UIUC</th>
</tr>
</thead><tbody>
<tr>
<td align="center">acc:</td>
<td align="center">87.1</td>
<td align="center">53.0</td>
<td align="center">98.8</td>
</tr>
</tbody></table>

<h4>code</h4> 
<ul>
<li>feature_extraction_exmaple.m     -- you can use this code as template to extract feature as feed to SVM/softmax to get your own score</li>
<li>prepare_image.m          -- serve as function to pre-process image patches</li> 
</ul>

<h4>usage</h4> 
<p>1. Download code and model</p>
<p>2. Extract features (feature_extraction_example.m and prepare_image.m)</p>
<p>3. Feed the feature to SVM/softmax to get the score.</p>

<h4>model</h4> 
<ul>
<li><a href="http://mmlab.siat.ac.cn/transfer_chalearn_models/">ChaLearn Models</a></li>
<li><a href="http://mmlab.siat.ac.cn/transfer_wider_models/">Wider Models</a></li> 
</ul>

<h4>Pictures</h4> 
<ul>
<li>Code and Files needed to plot figures in the paper</a></li>
</ul>
![alt text](http://wangzheallen.github.io/cultural_event/1.png "Distribution")
![alt text](http://wangzheallen.github.io/cultural_event/2.png "Heatmap1")
![alt text](hhttp://wangzheallen.github.io/cultural_event/3.png "Heatmap2")


<ul>
<li><a href="http://wanglimin.github.io/">Limin Wang</a></li>
<li><a href="http://wangzheallen.github.io/">Zhe Wang</a></li>
</ul>


