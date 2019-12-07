<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
  <meta name="generator" content="pandoc" />
  <title>The FeatureSmith Dataset</title>
  <style type="text/css">code{white-space: pre;}</style>
  <link rel="stylesheet" href="./css/style.css" type="text/css" />
</head>
<body>
<div id="header">
<h1 class="title">The FeatureSmith Dataset</h1>
</div>
<p><a href="http://www.umiacs.umd.edu/~tdumitra/blog/2016/10/16/automatic-feature-engineering-learning-how-to-detect-malware-by-mining-the-scientific-literature/" target="_top"><img style="border:1px solid #aaa; margin-left:20px; float: right;" width="275px" src="ccs16_first_page.png"></a></p>
<p>This site provides supplemental information for the paper <a href="http://www.umiacs.umd.edu/~tdumitra/blog/2016/10/16/automatic-feature-engineering-learning-how-to-detect-malware-by-mining-the-scientific-literature/" target="_top">FeatureSmith: Automatically Engineering Features for Malware Detection by Mining the Security Literature</a>, by Ziyun Zhu and <a href="http://www.umiacs.umd.edu/~tdumitra/" target="_top">Tudor Dumitraș</a>. This paper describes the design of a system that can generate, without human intervention, features for training machine learning classifiers to detect Android malware malware. FeatureSmith achieves this by synthesizing the security knowledge described in natural language documents, such as papers published in security conferences and journals.</p>
<p>The key data structure in FeatureSmith is the <em>semantic network</em>, which encodes the knowledge about malware behaviors reflected in our corpus of documents. The semantic network has three types of nodes:</p>
<ul>
<li>Known malware families (e.g. Gappusin)</li>
<li>Abstract malicious behaviors (e.g. &quot;<em>steal sensitive data</em>&quot;)</li>
<li>Concrete features that can be extracted from Android apps through static analysis (e.g. the <code>SEND_SMS</code> permission).</li>
</ul>
<p>The links among these nodes reflect concepts that are semantically related and allow us to rank the features according to how useful they are for detecting malicious behaviors. For example, here are the top-5 automatically engineered features (you can click the feature to find related behaviors; the format is explained below):</p>
<ol style="list-style-type: decimal">
<li><a href="./behaviors/sendTextMessage.txt">sendTextMessage</a></li>
<li><a href="./behaviors/SEND_SMS.txt">SEND_SMS</a></li>
<li><a href="./behaviors/BOOT_COMPLETED.txt">BOOT_COMPLETED</a></li>
<li><a href="./behaviors/RECEIVE_SMS.txt">RECEIVE_SMS</a></li>
<li><a href="./behaviors/onStart.txt">onStart</a></li>
</ol>
<p>To stimulate further research into semantics-aware security, we release our semantic network and the automatically generated features.</p>
<h2 id="sharing-and-attribution-terms">Sharing and Attribution Terms</h2>
<p>We are making our data available to the security community. <!--
we hope you will find it useful. The data is in a password-protected archive that you can download below. To get the password, please send an email to `featuresmith [at] umiacs [dot] umd [dot] edu` with the following information:

- **If you are in academia**: Ask your project PI (e.g. the faculty advisor) to send us an email from his/her university email account. The email should include the PI's name, affiliation, and homepage, to allow us to determine your identity and affiliation.
- **If you are in the industry**: Send us an email from your company's email account. Briefly introduce yourself and your company, and attach a justification letter for your request (in PDF format, on official company letterhead). The justification letter should (1) acknowledge the "FeatureSmith" project from the University of Maryland, College Park; (2) state clearly your reasons for requesting the dataset; and (3) acknowledge that the dataset will not be shared to others without our permission.

--> If you use the FeatureSmith data set in your research, don't link to this page; instead, please cite our paper:</p>
<blockquote>
<p>Z. Zhu and T. Dumitraș, &quot;FeatureSmith: Automatically Engineering Features for Malware Detection by Mining the Security Literature,&quot; in <em>ACM Conference on Computer and Communications Security (CCS)</em>, Vienna, AT, 2016.</p>
</blockquote>
<h2 id="data-sources-and-collection-method">Data Sources and Collection Method</h2>
<p>Our primary data source consists of scientific papers. We utilize these papers to extract Android malware behaviors and to construct the semantic network. From the electronic proceedings distributed to conference participants, we collect the papers from the IEEE Symposium on Security and Privacy (S&amp;P'08–S&amp;P'15), the Computer Security Foundations Symposium (CSF'00–CSF'14), and USENIX Security (Sec'11). We complement this corpus by searching Google Scholar with the keywords “Android malware”, and then we download the PDF files if a download link is provided in the query results. This process may result in duplicate papers, if a returned paper already exists in our corpus. Therefore, we record the hash of all the papers in our corpus, and remove a PDF document if the file hash already exists in the data set. In total, our corpus includes 1,068 documents. Table below is the summary of our document corpus.</p>
<table>
<thead>
<tr class="header">
<th>Document source</th>
<th align="right">count</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>IEEE S&amp;P</td>
<td align="right">465</td>
</tr>
<tr class="even">
<td>IEEE CSF</td>
<td align="right">437</td>
</tr>
<tr class="odd">
<td>USENIX Sec</td>
<td align="right">35</td>
</tr>
<tr class="even">
<td>Google Scholar</td>
<td align="right">241</td>
</tr>
<tr class="odd">
<td><strong>Total</strong></td>
<td align="right"><strong>1,068</strong></td>
</tr>
</tbody>
</table>
<p>We extract the text from the papers in PDF format, for later processing. We develop several heuristics to address this problem. We convert the PDF files to text with the Python package <code>pdfminer</code>.</p>
<p>We collect the malware family names from both the <a href="https://www.sec.cs.tu-bs.de/~danarp/drebin/">Drebin dataset</a> and from a list of <a href="https://forensics.spreitzenbarth.de/android-malware/">malware families</a> caught by the Mobile-Sandbox analysis platform.</p>
<table>
<thead>
<tr class="header">
<th>Malware source</th>
<th align="right">count</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Drebin</td>
<td align="right">180</td>
</tr>
<tr class="even">
<td>Mobile-Sandbox</td>
<td align="right">210</td>
</tr>
<tr class="odd">
<td><strong>Total</strong></td>
<td align="right"><strong>280</strong></td>
</tr>
</tbody>
</table>
<p>In total, we collect 280 malware names. We utilize these names when mining the papers on Android malware to identify sentences that discuss malicious behaviors. In addition to the concrete family names, we also utilize the term “malware” and its variants for this purpose.</p>
<p>We select permissions, intents, and API calls as potential features for malware detection. We collect all the permissions, intents and API calls from <a href="https://developer.android.com/index.html">Android developer documents</a> (API level 23). Then, we ignore the class name for each feature, because we have found that class names are not mentioned in most papers. Then based on the names, we remove some of features that potentially cause ambiguity like &quot;length&quot;. The features are summarized below.</p>
<table>
<thead>
<tr class="header">
<th>Feature source</th>
<th align="right">count</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>permissions</td>
<td align="right">132</td>
</tr>
<tr class="even">
<td>intents</td>
<td align="right">189</td>
</tr>
<tr class="odd">
<td>API methods</td>
<td align="right">11,373</td>
</tr>
<tr class="even">
<td><strong>Total</strong></td>
<td align="right"><strong>11,694</strong></td>
</tr>
</tbody>
</table>
<p>Note that not all the malware and features are mentioned in our document corpus, so the actual number of malware and features is lower than the number we show above.</p>
<h2 id="semantic-network">Semantic Network</h2>
<p>FeatureSmith represents the knowledge about malware behavior using a 3-layer semantic network. The data is in a sqlite database, which consists of 3 tables: <code>mal2behav</code>, <code>feat2behav</code> and<code>behaviorScore</code>, described below.</p>
<h3 id="mal2behav">mal2behav</h3>
<p>This table describes the links between known malware families and malware behaviors.</p>
<table>
<colgroup>
<col width="5%" />
<col width="94%" />
</colgroup>
<thead>
<tr class="header">
<th>Column</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>malware</td>
<td>The name of malware family</td>
</tr>
<tr class="even">
<td>behavior</td>
<td>Description of behavior, which consists of subject, verb and object. We use &quot;--&gt;&quot; as the delimiter for the three components. For example, &quot;--&gt;delete--&gt;user_data&quot; means that the verb is &quot;delete&quot; and the object is &quot;user data&quot;. In this case, the subject is NULL.</td>
</tr>
<tr class="odd">
<td>colocation</td>
<td>How many times the behavior and feature appear together within a certain window. In our experiment, we set the window to be 3 sentences.</td>
</tr>
</tbody>
</table>
<h3 id="feat2behav">feat2behav</h3>
<p>This table describes the links between malware behaviors and app features.</p>
<table>
<thead>
<tr class="header">
<th>Column</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>feature</td>
<td>The name of feature</td>
</tr>
<tr class="even">
<td>behavior</td>
<td>The same as <strong>mal2behav</strong> table</td>
</tr>
<tr class="odd">
<td>colocation</td>
<td>The same as <strong>mal2behav</strong> table</td>
</tr>
</tbody>
</table>
<h3 id="behaviorscore">behaviorScore</h3>
<p>This table describes the initial weight for the behaviors, which we use when learning which behaviors are most closely related to Android malware.</p>
<table>
<thead>
<tr class="header">
<th>Column</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>behavior</td>
<td>The same as <strong>mal2behav</strong> table</td>
</tr>
<tr class="even">
<td>score</td>
<td>The score of behavior</td>
</tr>
</tbody>
</table>
<p>You can download the database <a href="./Semantic%20Network.zip">here</a>.</p>
<h2 id="acknowledgments">Acknowledgments</h2>
<p>This research was partially supported by the National Science Foundation (grant 5-244780) and by the Maryland Procurement Office (contract H98230-14-C-0127). This website represents the position of the authors and not that of the aforementioned agencies.</p>
<!--
## The following institutions were given access
1. University of Illinois at Urbana-Champaign, USA
2. University of Melbourne, Australia
3. Shanghai Jiao Tong University, China
4. University of Virginia, USA
5. The Hong Kong Polytechnic University, China
6. Chinese Academy of Sciences, China
7. Bangladesh University of Engineering & Technology, Bangladesh
8. University of Maryland, Baltimore County, USA
9. Daffodil International University, Bangladesh
10. FAST National University of Computer and Emerging Sciences, Peshawar, Pakistan
11. University of Technology Sydney, Australia
12. Arizona State University, USA
13. University of Luxembourg, Luxembourg
14. University of British Columbia, Canada
15. Universiti Teknikal Malaysia Melaka, Malaysia
-->
<!-- Start of Google Analytics Code -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-56093969-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- End of Google Analytics Code -->

<!-- Start of StatCounter Code for Default Guide -->
<script type="text/javascript">
var sc_project=11144708; 
var sc_invisible=1; 
var sc_security="9adc5eb8"; 
var scJsHost = (("https:" == document.location.protocol) ?
"https://secure." : "http://www.");
document.write("<sc"+"ript type='text/javascript' src='" +
scJsHost+
"statcounter.com/counter/counter.js'></"+"script>");
</script>
<noscript><div class="statcounter"><a title="web analytics"
href="http://statcounter.com/web-analytics/"
target="_blank"><img class="statcounter"
src="//c.statcounter.com/11144708/0/9adc5eb8/1/" alt="web
analytics"></a></div></noscript>
<!-- End of StatCounter Code for Default Guide -->
</body>
</html>
