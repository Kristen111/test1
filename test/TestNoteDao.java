import com.aistar.dao.NoteDao;
import com.aistar.entity.Note;
import com.aistar.util.MyBatisUtil;
import org.junit.Test;

public class TestNoteDao {
    @Test
    public void testQueryById(){
        NoteDao dao = MyBatisUtil.getSqlSession().getMapper(NoteDao.class);
        Note note = dao.selectByPrimaryKey(2);
        System.out.println(note);
    }


}
