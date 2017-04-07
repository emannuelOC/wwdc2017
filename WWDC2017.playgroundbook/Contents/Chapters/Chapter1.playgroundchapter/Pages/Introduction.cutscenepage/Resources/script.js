var index = 1;

var informations = [
                    {},
                    {
                    title: "Let's learn together about...",
                    image: "thinking.png",
                    text: "How our brain processes language"
                    },
                    {
                    title: "Let's learn together about...",
                    image: "sick.png",
                    text: "How brain diseases can affect language"
                    },
                    {
                    title: "Let's learn together about...",
                    image: "nerdy.png",
                    text: "How mobile technology can help with the treatment"
                    }
                    ];

var controls = "";
controls += "<!-- control buttons -->\n";
controls += "<div id=\"control_buttons\">";
controls += "<button id=\"back_button\" onclick=\"goBack()\"></button>";
controls += "<span id=\"page_number\">1 of 4</span>";
controls += "<button id=\"next_button\" onclick=\"goForward()\"></button>";
controls += "</div>";

var originalInfo = "";
originalInfo += "<p>Language, Technology</p>\n";
originalInfo += "\t<img alt=\"icon\" id=\"introduction_icon\" src=\"nerdy.png\">\n";
originalInfo += "<p>and the Brain</p>";
originalInfo += controls;

function goBack() {
    if (index <= 1) { return }
    index = index-1;
    // alert("goBack()");
    if (index != 1) {
        setContainer(informations[index-1])
    } else {
        document.getElementById("main_container").innerHTML = originalInfo;
    }
    document.getElementById("page_number").innerHTML = index + " of 4";
}

function goForward() {
    
    if (index >= 4) {
        window.location='@next';
        return;
    }
    index = index+1;
    // alert("goForward()");
    if (index != 1) {
        setContainer(informations[index-1])
    }
    document.getElementById("page_number").innerHTML = index + " of 4";
}

function setContainer(data) {
    let title = data.title;
    let imageName = data.image;
    let text = data.text;
    
    var element = "";
    element += "<p id=\"title_text\">"+title+"</p>\n";
    element += "\t<div id=\"item_container\">\n";
    element += "\t\t<div id=\"item_image_div\"><img src=\""+imageName+"\" id=\"item_image\"></div>\n";
    element += "\t\t<div id=\"item_text\">\n";
    element += "\t\t\t<p>"+text+"</p>\n";
    element += "\t\t</div>\n\t</div>"
    
    element += controls;
    
    document.getElementById("main_container").innerHTML = element;
}

var controls = "";
controls += "<!-- control buttons -->\n";
controls += "<div id=\"control_buttons\">";
controls += "<button id=\"back_button\" onclick=\"goBack()\"></button>";
controls += "<span id=\"page_number\">1 of 4</span>";
controls += "<button id=\"next_button\" onclick=\"goForward()\"></button>";
controls += "</div>";

/*
 
 <!-- control buttons -->
 <div id="control_buttons">
 <button id="back_button" onclick="goBack()"></button>
 <span id="page_number">1 of 4</span>
 <button id="next_button" onclick="goForward()"></button>
 </div>
 
 <p>Language</p>
 <img alt="icon" id="introduction_icon" src="xcode.icns">
 <p>and the Brain</p>
 
 <p id="title_text">Let's learn together about...</p>
 <div id="item_container">
 <div id="item_image_div"><img src="xcode.icns" id="item_image"></div>
 <div id="item_text">
 <p>How our brain handles language</p>
 </div>
 </div>
 
 */
