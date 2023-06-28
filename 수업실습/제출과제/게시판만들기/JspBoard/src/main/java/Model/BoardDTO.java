package Model;

public class BoardDTO {
    private int id;
    private String name;
    private String title;
    private String content;
    private String date;
    private String group;
    private String level;
    private String indent;
    private int view;
    
    
    
    
    public BoardDTO(int id, String name, String title, String content, String date, String group,
            String level, String indent, int view) {
        super();
        this.id = id;
        this.name = name;
        this.title = title;
        this.content = content;
        this.date = date;
        this.group = group;
        this.level = level;
        this.indent = indent;
        this.view = view;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getGroup() {
        return group;
    }
    public void setGroup(String group) {
        this.group = group;
    }
    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }
    public String getIndent() {
        return indent;
    }
    public void setIndent(String indent) {
        this.indent = indent;
    }
    public int getView() {
        return view;
    }
    public void setView(int view) {
        this.view = view;
    }
    
    
        
    
    
    }
