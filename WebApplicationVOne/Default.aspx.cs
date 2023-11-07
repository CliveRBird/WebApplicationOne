using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System.IO;

namespace WebApplicationVOne
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateWordDoc_Click(object sender, EventArgs e)
        {
            string wordfilename = "MSworddoc.docx";
            CreateWordDoc(wordfilename);
        }

        private void BuildDocument(string wordfilename, string currText)
        {
            // Create Stream
            using (MemoryStream mem = new MemoryStream())
            {
                using (var wordDoc = WordprocessingDocument.Create(wordfilename, WordprocessingDocumentType.Document))
                {
                    var mainPart = wordDoc.AddMainDocumentPart();
                    mainPart.Document = new Document();

                    var run = new Run();


                    run.AppendChild(new Text(currText));
                    run.AppendChild(new CarriageReturn());


                    var paragraph = new Paragraph(run);
                    var body = new Body(paragraph);

                    mainPart.Document.Append(body);

                    var runProp = new RunProperties();

                    var runFont = new RunFonts { Ascii = "Arial" };

                    // 48 half-point font size
                    var size = new DocumentFormat.OpenXml.Wordprocessing.FontSize { Val = new StringValue("48") };

                    runProp.Append(runFont);
                    runProp.Append(size);

                    run.PrependChild(runProp);

                    mainPart.Document.Save();
                    wordDoc.Close();
                }

                // Download File
                Response.AppendHeader("Content-disposition", "attachment; filename=" + wordfilename);
                mem.Position = 0;
                mem.CopyTo(Context.Response.OutputStream);
                Context.Response.Flush();
                Context.Response.End();
            }
        }

        protected void CreateWordDoc(string wordfilename)
        {
            // Create Stream
            using (MemoryStream mem = new MemoryStream())
            {
                // Create Document
                using (WordprocessingDocument wordDocument = WordprocessingDocument.Create(mem, WordprocessingDocumentType.Document, true))
                {

                    MainDocumentPart mainPart = wordDocument.AddMainDocumentPart();
                    mainPart.Document = new Document();
                    Body body = mainPart.Document.AppendChild(new Body());

                    //
                    // Contents
                    //

                    Paragraph para = body.AppendChild(new Paragraph());
                    ParagraphProperties paraprop = new ParagraphProperties();
                    paraprop.Justification = new Justification() { Val = JustificationValues.Center };
                    // Add paragraph properties to your paragraph
                    para.Append(paraprop);

                    Run run = para.AppendChild(new Run());
                    run.AppendChild(new Text("Executive Summary"));
                    body.AppendChild(new Break());

                    Paragraph p0 = new Paragraph();
                    Run r0 = new Run();
                    Text t0 = new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quam augue, tempus id metus in, laoreet viverra quam. Sed vulputate risus lacus, et dapibus orci porttitor non.");
                    r0.Append(t0);
                    p0.Append(r0);
                    body.Append(p0);

                    Paragraph p_1 = new Paragraph();
                    Run r_1 = new Run();
                    Text t_1 = new Text("Cum grano salis");
                    r_1.Append(t_1);
                    p_1.Append(r_1);
                    body.Append(p_1);

                    body.Append(new Paragraph(new Run(new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quam augue, tempus id metus in, laoreet viverra quam. Sed vulputate risus lacus, et dapibus orci porttitor non."))));
                    body.AppendChild(new Break());
                    body.Append(new Paragraph(new Run(new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quam augue, tempus id metus in, laoreet viverra quam. Sed vulputate risus lacus, et dapibus orci porttitor non."))));
                    body.AppendChild(new Break());
                    body.Append(new Paragraph(new Run(new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quam augue, tempus id metus in, laoreet viverra quam. Sed vulputate risus lacus, et dapibus orci porttitor non."))));

                    body.AppendChild(new CarriageReturn());

                    /*
                    About the second paragraph, you can see some words are normal, some words are bold, some italic and bold and some words are red.To do that you have to split your paragraph in different runs with different run properties.
                    So we are going to have a Paragraph, with different runs and inside each runs, a run properties.
                    */

                    Paragraph p = new Paragraph();
                    // Run 1
                    Run r1 = new Run();
                    Text t1 = new Text("Pellentesque ") { Space = SpaceProcessingModeValues.Preserve };
                    // The Space attribute preserve white space before and after your text
                    r1.Append(t1);
                    p.Append(r1);

                    // Run 2 - Bold
                    Run r2 = new Run();
                    RunProperties rp2 = new RunProperties();
                    rp2.Bold = new Bold();
                    // Always add properties first
                    r2.Append(rp2);
                    Text t2 = new Text("commodo ") { Space = SpaceProcessingModeValues.Preserve };
                    r2.Append(t2);
                    p.Append(r2);

                    // Run 3
                    Run r3 = new Run();
                    Text t3 = new Text("rhoncus ") { Space = SpaceProcessingModeValues.Preserve };
                    r3.Append(t3);
                    p.Append(r3);

                    // Run 4 – Italic
                    Run r4 = new Run();
                    RunProperties rp4 = new RunProperties();
                    rp4.Italic = new Italic();
                    // Always add properties first
                    r4.Append(rp4);
                    Text t4 = new Text("mauris") { Space = SpaceProcessingModeValues.Preserve };
                    r4.Append(t4);
                    p.Append(r4);

                    // Run 5
                    Run r5 = new Run();
                    Text t5 = new Text(", sit ") { Space = SpaceProcessingModeValues.Preserve };
                    r5.Append(t5);
                    p.Append(r5);

                    // Run 6 – Italic , bold and underlined
                    Run r6 = new Run();
                    RunProperties rp6 = new RunProperties();
                    rp6.Italic = new Italic();
                    rp6.Bold = new Bold();
                    rp6.Underline = new Underline();
                    // Always add properties first
                    r6.Append(rp6);
                    Text t6 = new Text("amet ") { Space = SpaceProcessingModeValues.Preserve };
                    r6.Append(t6);
                    p.Append(r6);

                    // Run 7
                    Run r7 = new Run();
                    Text t7 = new Text("faucibus arcu ") { Space = SpaceProcessingModeValues.Preserve };
                    r7.Append(t7);
                    p.Append(r7);

                    // Run 8 – Red color
                    Run r8 = new Run();
                    RunProperties rp8 = new RunProperties();
                    rp8.Color = new Color() { Val = "FF0000" };
                    // Always add properties first
                    r8.Append(rp8);
                    Text t8 = new Text("porttitor ") { Space = SpaceProcessingModeValues.Preserve };
                    r8.Append(t8);
                    p.Append(r8);

                    // Run 9
                    Run r9 = new Run();
                    Text t9 = new Text("pharetra. Maecenas quis erat quis eros iaculis placerat ut at mauris.") { Space = SpaceProcessingModeValues.Preserve };
                    r9.Append(t9);
                    p.Append(r9);
                    // Add your paragraph to docx body
                    body.Append(p);

                    Paragraph p10 = new Paragraph();
                    ParagraphProperties pp10 = new ParagraphProperties();
                    pp10.Justification = new Justification() { Val = JustificationValues.Center };
                    // Add paragraph properties to your paragraph
                    p10.Append(pp10);
                    // Run
                    Run r10 = new Run();
                    Text t10 = new Text("Nam eu tortor ut mi euismod eleifend in ut ante. Donec a ligula ante. Sed rutrum ex quam. Nunc id mi ultricies, vestibulum sapien vel, posuere dui.") { Space = SpaceProcessingModeValues.Preserve };
                    r10.Append(t10);
                    p10.Append(r10);
                    // Add your paragraph to docx body
                    body.Append(p10);

                    // break

                    body.AppendChild(new Text("Hello"));
                    body.AppendChild(new Break());
                    body.AppendChild(new Break());
                    body.AppendChild(new Text("World."));

                    ///// Below isn't working

                    Paragraph parax = body.AppendChild(new Paragraph());
                    ParagraphProperties paraxprop = new ParagraphProperties();
                    paraxprop.Justification = new Justification() { Val = JustificationValues.Center };
                    // Add paragraph properties to your paragraph
                    parax.Append(paraxprop);

                    Run runx = para.AppendChild(new Run());
                    runx.AppendChild(new Text("Executive Summary End"));
                    body.AppendChild(new Break());


                    Paragraph paragraph = body.AppendChild(new Paragraph());
                    var run_formatted = new Run();
                    run_formatted.AppendChild(new Text("Clive Bird"));
                    run_formatted.AppendChild(new CarriageReturn());

                    paragraph = new Paragraph(run_formatted);

                    var runProp = new RunProperties();
                    var runFont = new RunFonts { Ascii = "Arial" };

                    // 48 half-point font size
                    var size = new DocumentFormat.OpenXml.Wordprocessing.FontSize { Val = new StringValue("48") };

                    runProp.Append(runFont);
                    runProp.Append(size);
                    run_formatted.PrependChild(runProp);


                    mainPart.Document.Save();
                    wordDocument.Close();

                }

                // Download File
                Response.AppendHeader("Content-disposition", "attachment; filename=" + wordfilename);
                mem.Position = 0;
                mem.CopyTo(Context.Response.OutputStream);
                Context.Response.Flush();
                Context.Response.End();
            }
        }

    }
}