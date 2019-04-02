using System;
using System.Collections.Generic;
using System.IO;//引入IO
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace IO
{
    class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine(File.Exists(@"C:\HelloIO\IO.txt"));
            //判断文件是否存在，是返回True，否返回False
            //Console.WriteLine(Directory.Exists(@"C:\"));
            //判断文件夹是否存在，是返回True，否返回False

            string path = ".";
            if(args.Length>0)
            {
                if(Directory.Exists(args[0]))
                {
                    path = args[0];
                }
                else
                {
                    Console.WriteLine("{0} not found;using current dirrectory:",args[0]);
                }
            }
            DirectoryInfo dir=new DirectoryInfo(path);
            foreach (FileInfo f in dir.GetFiles("*.exe"))
            {
                string name = f.Name;
                long size = f.Length;
                DateTime creationTime = f.CreationTime;
                Console.WriteLine("{0,-12:NO}{1,-20:g}{2}",size,creationTime,name);
                //{0,-12:NO}有误
            }
            Console.ReadLine();
        }
    }
}

//IORead
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IORead
{
    class Program
    {
        private const string FILE_NAME = "Test.txt";
        static void Main(string[] args)
        {
            if (!File.Exists(FILE_NAME))
            {
                Console.WriteLine("{0} does not exist!", FILE_NAME);
                Console.ReadLine();
                return;
            }

            //using(StreamReader sr=File.OpenText(FILE_NAME))
            //{
            //    string input;
            //    while((input=sr.ReadLine())!=null)
            //    {
            //        //一行一行的输出文本里的内容
            //        Console.WriteLine(input);
            //    }
            //    Console.WriteLine("The end of stream");
            //    sr.Close();
            //}
            //Console.ReadLine();
            //2.
            FileStream fs = new FileStream(FILE_NAME, FileMode.Open, FileAccess.Read);
            //打开的方式FileMode.Open，进入的权限 FileAccess.Read
            BinaryReader r = new BinaryReader(fs);
            for (int i = 0; i < 11; i++)
            {
                Console.WriteLine(r.ReadChar());
            }
            r.Close();
            fs.Close();
            Console.ReadLine();
        }
    }
}

//IOWrite
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IOWrite
{
    class Program
    {
        private const string FILE_NAME = "Test.txt";
        static void Main(string[] args)
        {
            //1.创建文件，写入文件
            //if(File.Exists(FILE_NAME))
            //{
            //    Console.WriteLine("{0} already exists", FILE_NAME);
            //    Console.ReadLine();
            //    return;
            //}
            //FileStream fs = new FileStream(FILE_NAME,FileMode.Create);
            //BinaryWriter w = new BinaryWriter(fs);
            //for (int i = 0; i < 11; i++)
            //{
            //    w.Write('a');
            //}
            //w.Close();
            //fs.Close();
            //2.向文件里追加内容
            using (StreamWriter w = File.AppendText("Test.txt"))
            {
                Log("hehe", w);
                Log("Hello", w);
                w.Close();
            }
        }
        public static void Log(string logMessage,TextWriter w)
        {
            w.Write("Log Entry");
            w.WriteLine(":{0}", logMessage);
        }
    }
}
