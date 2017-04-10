package utility;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import au.com.bytecode.opencsv.CSVReader;

public class ReadExcelData {
	public static XSSFSheet sheet;
	public static Map<String,String> testInputData=getAllTestData();
	/**
	 * @author yanzhi
	 * This method implements how to get the specified sheet
	 * @param firepath
	 * @param sheetname
	 */
    public static void setPath(String firepath,String sheetname){
    	FileInputStream fs;
		try {
			fs = new FileInputStream(firepath);
			XSSFWorkbook workbook =new XSSFWorkbook(fs);
	    	sheet=workbook.getSheet(sheetname);
		 } catch (IOException e) {
			 Log.error("Package utiliy||Class ReadExcelData||Method setPath"+e.getMessage());
			 e.printStackTrace();
		}
    	
    }
    /**
     * This method implements how to get the specified cell value based on the row number and column number
     * @param row 行
     * @param column 列
     * @return
     */
    public static String getCellData(int row, int column){ //读取指定行和列的数值
    	XSSFCell cell=sheet.getRow(row).getCell(column);//file文件中识别为Excel格式
    	String cellvalue=null;
    	switch(cell.getCellType()){
    	case XSSFCell.CELL_TYPE_NUMERIC:
    		cellvalue=cell.getRawValue();
    		break;
        case XSSFCell.CELL_TYPE_STRING:
    		cellvalue=cell.getStringCellValue();
    		break;
        case XSSFCell.CELL_TYPE_BLANK:        	
    		cellvalue="";
    		break;    
    	default:
    	    Log.error("Excel data type does not exist.Cell type is:"+cell.getCellType());
    		break;  			
    	}
    	return cellvalue;
     
    }
    /**
     * 获得行号
     */
    public static int getRowContains(String key,int column){
    	int i;
    	int rowcount=sheet.getLastRowNum();
    	for(i=1;i<rowcount;i++){
    		if(ReadExcelData.getCellData(i, column).equalsIgnoreCase(key)){
    			break;
    		}
    	}
    	if(i>=rowcount){
    		Log.error("[getRowContains]:Can not find"+key);
    	}
    	
    	return i;
    }
     
    public static String getTestData(String key){
    	ReadExcelData.setPath(Constants.path+Constants.filename,Constants.sheetname);//找到指定Excel和sheet
    	int rowNum=ReadExcelData.getRowContains(key, Constants.keycolumn); //获取制定列
    	String cellValue=ReadExcelData.getCellData(rowNum, Constants.column);//根据行和列获取数值
    	return cellValue;
    }
	public static Map<String,String> getAllTestData() {
		Map<String,String> mapData=new HashMap<String,String>();
	       setPath(Constants.path+Constants.filename,Constants.sheetname);
	       int rowNumber=sheet.getPhysicalNumberOfRows();
	       XSSFCell cell2 = null;
	       XSSFCell cell1 = null;
	       for (int i = 1; i < rowNumber; i++) {
	    	   cell1=sheet.getRow(i).getCell(Constants.keycolumn);
	    	   if(cell1.getCellType()!=XSSFCell.CELL_TYPE_BLANK){
	    		   String keyValue=cell1.getStringCellValue();
	    		   String value;
	    		   cell2=sheet.getRow(i).getCell(Constants.column);
	    		   switch (cell2.getCellType()) {
	    			case XSSFCell.CELL_TYPE_NUMERIC:
	    				value = cell2.getRawValue().toString().trim().toLowerCase();
	    				mapData.put(keyValue, value);
	    				break;
	    			case XSSFCell.CELL_TYPE_STRING:
	    				value = cell2.getStringCellValue().toString().trim().toLowerCase();
	    				mapData.put(keyValue, value);
	    				break;
	    			case XSSFCell.CELL_TYPE_BLANK:
	    				value ="";
	    				mapData.put(keyValue, value);
	    				break;
	    			default:
	    				Log.warn("Excel data type does not exist. Cell type is:"+cell2.getCellType());
	    				break;
	    			}
	    	   }
			
		}
		return mapData;
	   
	}
	
	public static String getMapData(String skey) {
		
		
		return  testInputData.get(skey).toLowerCase();
		
	}
	
	public static List<String[]> getTestDataFromObjectsFile(){
		CSVReader csvReader;
		List<String[]> lists =new ArrayList<>();
				
		try {
				csvReader = new CSVReader(new FileReader(Constants.path + Constants.csvfilename));
				lists = csvReader.readAll();
				csvReader.close();
			} catch (IOException e) {
				Log.error("Fail to get the web locators from ObjectRepository file. ");
				e.printStackTrace();
			} 
				
		return lists;
	}
	public static List<String[]> getLocatorsFromObjectsFile(){
		CSVReader csvReader;
		List<String[]> lists =new ArrayList<>();
				
		try {
				csvReader = new CSVReader(new FileReader(Constants.path + Constants.objectfile));
				lists = csvReader.readAll();
				csvReader.close();
			} catch (IOException e) {
				Log.error("Fail to get the web locators from ObjectRepository file. ");
				e.printStackTrace();
			} 
				
		return lists;
	}
   
    
}
