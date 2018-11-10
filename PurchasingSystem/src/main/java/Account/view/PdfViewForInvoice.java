package Account.view;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;

import Account.model.Accout_PayableBean;

public class PdfViewForInvoice extends AbstractITextPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<Accout_PayableBean> list = (List<Accout_PayableBean>) model.get("infoList");  
		
		BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
		Font font = new Font(bfChinese, 12, Font.NORMAL);
		
		Paragraph title=new Paragraph();//新增一個段落，類似html的<p>
		title.add(new Chunk("廠商帳款清單",font)); //新增一個字串然後加到Paragraph
		document.add(title); //每個element都要加到document才會顯示
		
		Paragraph reportdate=new Paragraph();//新增一個段落，類似html的<p>
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		reportdate.add(new Chunk("產生日期:"+sdf.format(new Date()),font)); //新增一個字串然後加到Paragraph
		document.add(reportdate); //每個element都要加到document才會顯示
		
		Paragraph line = new Paragraph();  
	    line.add(new Chunk(new LineSeparator()));    
	    document.add(line);
		
		PdfPTable table=new PdfPTable(11); //初始化Table然後指定欄位數目
		table.setWidthPercentage(100.0f); //設定Table填滿至頁面Margin          
		table.setWidths(new float[] {2.0f,2.0f,2.0f,1.0f,1.5f,1.5f,1.5f,1.5f,1.5f,1.5f,1.0f});//設定相對欄寬                      
		table.setSpacingBefore(10);
		
	
		PdfPCell cell = new PdfPCell(); //初始化Cell(欄位)
		
		cell.setPhrase(new Phrase("廠商帳款單號",font)); //填入Cell欄位字串，要new一個Phrase
		cell.setHorizontalAlignment(Element.ALIGN_CENTER); //置中對齊
		table.addCell(cell); //cell加到table中
		
		cell.setPhrase(new Phrase("請款單單號",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("廠商名稱",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("廠商結帳週期",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("應付款項金額",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("產生日期",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("支票號碼",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("匯款帳號",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("預計付款日",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("付款狀況",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("實付金額",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		
		
		
		Integer recordCounts=0; 
		for(Accout_PayableBean bean:list){ //利用for迴圈，把資料填入Cell
			table.addCell(bean.getAccoutpayable_no());
			table.addCell(bean.getInv_id());
			cell.setPhrase(new Phrase(bean.getpO_Vendor_InfoBean().getVendor_name(),font));
			table.addCell(cell);
			cell.setPhrase(new Phrase(bean.getpO_Vendor_InfoBean().getPayment_term(),font));
			table.addCell(cell);
			table.addCell(bean.getAmount_Payable().toString());
			table.addCell(sdf.format(bean.getBooking_Date()).toString());
			cell.setPhrase(new Phrase(bean.getCheque_no(),font));
			table.addCell(cell);
			table.addCell(bean.getpO_Vendor_InfoBean().getVendor_acc());
			if(bean.getExcept_Payment_Date()==null) {
				table.addCell("");
			}else {
			table.addCell(sdf.format(bean.getExcept_Payment_Date()).toString());}
			cell.setPhrase(new Phrase(bean.getPayable_Status(),font));
			table.addCell(cell);
			table.addCell(bean.getAmount_Paid().toString());
			recordCounts++;
		}
		document.add(table); //table加到document顯示
		
		Paragraph totalCounts=new Paragraph();//新增一個段落，類似html的<p>
		totalCounts.add(new Chunk("總筆數:"+recordCounts.toString(),font)); //新增一個字串然後加到Paragraph
		document.add(totalCounts); //每個element都要加到document才會顯示
		
		response.setContentType("application/pdf");  
        response.setCharacterEncoding("utf-8");  
        String fileName = "invoice.pdf";  
        //Content-disposition属性设置成以附件方式进行下载  
        response.setHeader("Content-disposition", "attachment;filename="  
                + fileName);  
        response.setHeader("Cache-Control",
                "must-revalidate, post-check=0, pre-check=0");
        
	}

	
}
